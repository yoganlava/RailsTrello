<template>
  <div>
    <div v-if="boardID == 0" class="no-board">
      <h1 style="font-weight: 500;font-size: 30px">Board not found</h1>
    </div>
    <div v-else>
      <page-loader v-model="loading"></page-loader>
      <add-access-modal v-model="showAccessModal"></add-access-modal>
      <card-modal
        :card="currentCard"
        v-model="showModal"
        @deleteCard="deleteItem"
      ></card-modal>
      <div class="board-details">
        <h1>{{ name }}</h1>
      </div>
      <div class="board-header">
        <div v-if="hasAccess">
          <button class="button is-success" @click="createTable">
            New Table
          </button>
          <button class="button is-link" @click="save">
            Save
          </button>
          <button class="button is-info" @click="openAccessModal">
            Share Access
          </button>
        </div>
      </div>
      <div>
        <draggable
          :list="board"
          v-bind="dragOptions"
          @end="updateColumnIndex"
          class="board-content"
        >
          <card-table
            v-for="item in board"
            :key="item.id"
            :model="item"
            @updateCard="updateCardPriority"
            @openCard="openCard"
            @deleteTable="deleteItem"
          ></card-table>
        </draggable>
      </div>
    </div>
  </div>
</template>

<script>
import Vue from "vue";
import draggable from "vuedraggable";
import { ajaxRequest, toastData } from "../../plugins/utils";
export default {
  data: () => ({
    name: "",
    boardID: 0,
    board: [],
    deletedCards: [],
    hasAccess: false,
    deletedTables: [],
    currentCard: {},
    showModal: false,
    showAccessModal: false,
    loading: false,
    dragOptions: {
      animation: 200,
      disabled: false,
      ghostClass: "ghost",
    },
  }),
  async mounted() {
    this.loading = true;
    let board = await ajaxRequest(`/board/${this.$route.params.id}`, "GET");
    if (board.error) {
      this.loading = false;
      toastData(board);
      return;
    }
    this.boardID = board.id;
    let hasAccessRes;
    try {
    hasAccessRes = await ajaxRequest(
      `/board/has_access`,
      { board_id: this.boardID },
      "POST"
    );
    toastData(hasAccessRes);
    } catch(e) {
      toastData({error: "No permissions"})
    }
    this.hasAccess = hasAccessRes == undefined;
    this.name = board.name;
    this.generateBoard();
    this.loading = false;
  },
  methods: {
    createTable() {
      console.log(this.board);
      let size = Object.keys(this.board).length;
      Vue.set(this.board, size, {
        name: "New Table",
        board_id: this.boardID,
        column_index: size,
        cards: [],
      });
    },
    async save() {
      this.loading = true;
      await ajaxRequest("/save", this.board, "POST");
      await ajaxRequest("/delete_tables", this.deletedTables, "POST");
      await ajaxRequest("/delete_cards", this.deletedCards, "POST");
      this.generateBoard();
      this.loading = false;
    },
    async generateBoard() {
      this.board = await ajaxRequest(
        "/get_card_tables",
        {
          id: this.boardID,
        },
        "GET"
      );
      this.board.forEach(async (table) => {
        Vue.set(
          table,
          "cards",
          await ajaxRequest(
            "/get_cards",
            {
              id: table.id,
            },
            "GET"
          )
        );
      });
    },
    openCard(card) {
      this.currentCard = card;
      this.showModal = !this.showModal;
    },
    async deleteItem(item) {
      if (await this.$dialog.confirm("Whould you like to delete this?")) {
        if (item.board_id) {
          this.deletedTables.push(item);
          Vue.delete(this.board, this.board.indexOf(item));
        } else {
          this.deletedCards.push(item);
          let list = this.board[
            this.board.indexOf(
              this.board.filter((table) => table.id == item.parent_id)[0]
            )
          ].cards;
          Vue.delete(list, list.indexOf(item));
        }
      }
    },
    updateColumnIndex() {
      this.board.forEach((table, index) => (table.column_index = index));
    },
    updateCardPriority(id) {
      this.board[id].cards.forEach((card, index) =>
        Vue.set(card, "priority", index)
      );
    },
    openAccessModal() {
      this.showAccessModal = !this.showAccessModal;
    },
  },
  components: {
    CardTable: () => import("../components/card-table"),
    draggable,
    CardModal: () => import("../components/card-modal"),
    PageLoader: () => import("../components/page-loader"),
    AddAccessModal: () => import("../components/add-access-modal"),
  },
};
</script>

<style lang="scss" scoped>
.board-details {
  text-align: center;
  font-weight: 400;
  font-size: 25px;
}

.board-content {
  display: flex;
}

.card-title {
  font-weight: 600;
}

.board-header {
  text-align: right;
  margin: 10px;
}

.card-table {
  background-color: #ebecf0;
  margin-left: 25px;
  width: 300px;
  padding: 10px;
  border-radius: 10px;
  box-shadow: 0 15px 35px 0 rgba(60, 66, 87, 0.12),
    0 5px 15px 0 rgba(0, 0, 0, 0.12);
}

.card-list {
  //   padding: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
}

.card {
  border-radius: 3px;
  padding: 5px;
  margin-bottom: 10px;
  cursor: pointer;
  box-shadow: 0 1px 0 rgba(9, 30, 66, 0.25);
  &:hover {
    background-color: #f4f5f7;
  }
}

.is-outlined {
  border-color: #605959 !important;
  color: #605959 !important;
}

.no-board {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
