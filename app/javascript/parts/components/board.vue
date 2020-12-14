<template>
<!-- this router link turns into a div becuase of the attribute tag
    the special ... spread operator is used in way that applies
    a background image if it exists; however, if it doesn't exist,
    it will use the background-color tag
 -->
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
  <!-- div that allows for right click to be prevented -->
    <div class="board-details" @contextmenu="openContextMenu($event)">
      <h2>{{ model.name }}</h2>
    </div>
  </router-link>
</template>

<script>
export default {
  props: ["model"],
  methods: {
    // prevent default action of right click and call open context menu
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
  overflow: hidden;
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
