<template>
  <div>
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
    <div >
      <draggable v-model="board" @start="drag=true" @end="drag=false" class="board-content">
        <card-table v-for="item in board" :key="item" :name="item.name" :cards="item.cards"></card-table>
      </draggable>
      <!-- <div class="card-table">
        <p class="card-title">Name</p>
        <div class="card-list">
          <div class="card">
            <p>Card 1</p>
          </div>
          <div class="card">
            <p>Card 1</p>
          </div>
        </div>
        <button
          class="button is-link is-inverted is-outlined"
          style="text-color: black"
          @click="save"
        >
          New Card
        </button>
      </div> -->
    </div>
  </div>
</template>

<script>
import Vue from 'vue';
import draggable from 'vuedraggable'
import { ajaxRequest } from "../../plugins/utils";
export default {
  data: () => ({
    name: "b2 QWD",
    board: [
      {
        name: "T1",
        cards: {
          0: {
            name: "baby",
            description: "AIODJAS",
            completed: false,
          },
          1: {
            name: "T2",
            description: "lOREM",
            completed: false,
          },
        },
      },
      {
        name: "OAKODAKSODKAOSDKO",
        cards: {
          0: {
            name: "",
            description: "",
            completed: false,
          },
          1: {
            name: "",
            description: "",
          },
          2: {
            name: "",
            description: "",
            completed: false,
          },
          3: {
            name: "",
            description: "",
          },
          2: {
            name: "IJSIDJASD",
            cards: {
              0: {
                name: "",
                description: "UU=ASASD",
                completed: false,
              },
            },
          },
        },
      },
    ],
  }),
  async mounted() {
    console.log(this.$route.params.id);
    let board = await ajaxRequest(`/board/${this.$route.params.id}`, "GET");
    this.name = board.name;

    // let tables = await ajaxRequest(`/`)
    console.log(this.board);
  },
  methods: {
    createTable: function() {
      console.log(this.board);
      let size = Object.keys(this.board).length;
      // this.board[size] = {
      //   name: "",
      //   cards: {},
      // };
      // Vue.set(this.board, size, {
      //   name: "",
      //   cards: {},
      // });
      // this.$nuxt.refresh()
    },
    createCard: function(tableID) {
      let size = Object.keys(this.board[tableID].cards).length;
      this.board[tableID].cards[size] = {
        name: "",
        description: "",
        completed: false,
      };
    },
    save: function() {
      console.log("teetet");
    },
  },
  components: {
    CardTable: () => import("../components/card-table"),
    draggable
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
