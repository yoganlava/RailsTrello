<template>
  <router-link
    :to="'/board/' + this.$vnode.key"
    tag="div"
    class="board"
    :style="{
      'background-color': this.model.color,
      ...(this.model.image != '' && {
        background: `url(${this.model.image})`,
        'background-repeat': 'no-repeat',
        'background-size': '100%',
      }),
    }"
  >
    <div class="board-details" @contextmenu="openContextMenu($event)">
      <h2>{{ model.name }}</h2>
    </div>
  </router-link>
</template>

<script>
export default {
  props: ["model"],
  methods: {
    openContextMenu(event) {
      event.preventDefault();
      this.$emit("openContextMenu", event, this.model);
    },
  },
};
</script>

<style scoped>
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
