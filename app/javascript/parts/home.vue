<template>
  <div class="boards">
    <create-board-modal v-model="showModal"></create-board-modal>
    <h1>Your boards</h1>
    <div class="board-list">
      <board title="Example 1" color="black"></board>
      <board title="Example 2" color="green"></board>
    </div>
    <h1>Create a board!</h1>
    <button class="button is-success" @click="toggleModal">Create</button>
  </div>
</template>
<script>
// import CreateBoardModal from './components/create-board-modal.vue'
export default {
  data: () => ({
    showModal: false
  }),
  components: {
    Board: () => import("./components/board"),
    CreateBoardModal: () => import("./components/create-board-modal")
  },
  methods: {
    toggleModal: function() {
      this.showModal = !this.showModal;
    }
  }
};
</script>

<style>
h1 {
  font-weight: 500;
  font-size: 48px;
}

.boards {
  text-align: center;
  margin: 30px;
}

.board-list {
    display: flex;
}
</style>
