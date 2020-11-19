<template>
  <div class="boards">
    <h1>Your boards</h1>
    <div class="board-list">
      <board title="Example 1" color="black"></board>
      <board title="Example 2" color="green"></board>
    </div>
    <h1>Create a board!</h1>
    <button class="button is-success">Create</button>
  </div>
</template>
<script>
import board from "./components/board";
import Board from "./components/board.vue";
export default {
  components: {
    board,
  },
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
