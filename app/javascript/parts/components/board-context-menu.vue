<template>
  <ul class="context-menu" style="display: none;">
    <li class="context-menu-item" @click="deleteBoard">
      <p>Delete</p>
    </li>
  </ul>
</template>

<script>
import { ajaxRequest, toastData } from "../../plugins/utils";
export default {
  props: ["board"],
  methods: {
    // make sure we want to delete the board and then send the request to backend
    // toast the data afterwards and delete clientside if successful
    async deleteBoard() {
      if (await this.$dialog.confirm("Would you like to delete this board?")) {
        const res = await ajaxRequest(
          "/board/delete_board",
          this.board,
          "POST"
        );
        toastData(res);
        if (res.message) this.$emit("deleteBoard", this.board);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.context-menu {
  z-index: 10;
  background: white;
  position: absolute;
  display: block;
  border-top: 1px solid grey;
  border-left: 1px solid grey;
  border-right: 1px solid grey;
}

.context-menu-item {
  border-bottom: 1px solid grey;
  &:hover {
    background: grey;
  }
}
</style>
