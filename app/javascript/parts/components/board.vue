<template>
  <div class="board" :style="{'background-color': this.color}">
    <div class="board-details">
      <h2>{{ title }}</h2>
    </div>
  </div>
</template>

<script>
export default {
    props: ['title', 'color']
}
</script>

<style>
.board {
  cursor: pointer;
  width: 15%;
  border-radius: 5px;
  display: block;
  margin: 30px;
}

.board-details {
  font-weight: 400;
  padding-top: 5px;
  color: white;
  padding-left: 10px;
  display: flex;
  text-align: left;
  height: 80px;
  position: relative;
  flex-direction: column;
  justify-content: space-between;
}
</style>
