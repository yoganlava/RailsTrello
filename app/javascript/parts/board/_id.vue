<template>
  <div>
    <card-modal :card="currentCard" v-model="showModal"></card-modal>
    <div class="board-details">
      <h1>{{ name }}</h1>
    </div>
    <div class="board-header">
      <button class="button is-success" @click="createTable">
        New Table
      </button>
      <button class="button is-link" @click="save">
        Save
      </button>
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
          :name="item.name"
          :cards="item.cards"
          :id="item.column_index"
          @updateCard="updateCardPriority"
          @openCard="openCard"
        ></card-table>
      </draggable>
    </div>
  </div>
</template>

<script>
import Vue from "vue";
import draggable from "vuedraggable";
import { ajaxRequest } from "../../plugins/utils";
export default {
  data: () => ({
    name: "",
    board: [],
    currentCard: {},
    showModal: false,
    dragOptions: {
      animation: 200,
      disabled: false,
      ghostClass: "ghost",
    },
  }),
  async mounted() {
    let board = await ajaxRequest(`/board/${this.$route.params.id}`, "GET");
    this.name = board.name;
    this.generateBoard();
  },
  methods: {
    createTable(){
      console.log(this.board)
      let size = Object.keys(this.board).length;
      Vue.set(this.board, size, {
        name: "New Table",
        board_id: this.$route.params.id,
        column_index: size,
        cards: [],
      });
    },
    async save() {
      await ajaxRequest(
        "/save",
        this.board,
        "POST"
      );
      this.generateBoard();
    },
    async generateBoard() {
      //TODO LOADING
      this.board = await ajaxRequest(
        "/get_card_tables",
        {
          id: this.$route.params.id,
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
    updateColumnIndex() {
      this.board.forEach((table, index) => table.column_index = index);
    },
    updateCardPriority(id) {
      console.log(this.board[id])
      this.board[id].cards.forEach((card, index) => Vue.set(card, "priority", index));
    }
  },
  components: {
    CardTable: () => import("../components/card-table"),
    draggable,
    CardModal: () => import("../components/card-modal"),
  },
};
</script>

<style lang="scss" scoped>
.board-details {
  text-align: center;
  border-bottom: black 3px solid;
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
</style>
