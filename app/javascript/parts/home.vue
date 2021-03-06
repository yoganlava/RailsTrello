<template>
<!-- when the screen is clicked, hide the context menu -->
  <div class="boards" @click="hideContextMenu">
    <page-loader v-model="loading"></page-loader>
    <board-context-menu
      :board="selectedBoard"
      @deleteBoard="deleteBoard"
      ref="contextMenu"
    ></board-context-menu>
    <!-- create board modal -->
    <create-board-modal v-model="showModal" @refresh="generateBoards"></create-board-modal>
    <h1>Your boards</h1>
    <div class="board-list">
      <!-- generate boards using v-for loop that loops through object -->
      <board
        v-for="board in this.boards"
        :key="board.id"
        :model="board"
        @openContextMenu="openContextMenu"
      ></board>
    </div>
    <h1>Shared boards</h1>
    <div class="board-list">
      <!-- generate boards using v-for loop that loops through object -->
      <board
        v-for="board in this.sharedBoards"
        :key="board.id"
        :model="board"
        @openContextMenu="openContextMenu"
      ></board>
    </div>
    <h1>Create a board!</h1>
    <button class="button is-success" @click="toggleModal">Create</button>
  </div>
</template>
<script>
import Vue from "vue";
import { ajaxRequest } from "../plugins/utils";

export default {
  data: () => ({
    showModal: false,
    selectedBoard: {},
    boards: [],
    loading: false,
    sharedBoards: [],
  }),
  components: {
    Board: () => import("./components/board"),
    CreateBoardModal: () => import("./components/create-board-modal"),
    BoardContextMenu: () => import("./components/board-context-menu"),
    PageLoader: () => import("./components/page-loader"),
  },
  // if the player is not logged in, send them to the index page
  // if they are logged in, fetch their boards
  async mounted() {
    if (!this.$store.state.user.email)
      this.$router.push("/")
    await this.generateBoards();
  },
  methods: {
    // toggle create board modal
    toggleModal() {
      this.showModal = !this.showModal;
    },
    // fetch user owned and shared boards
    async generateBoards() {
      this.loading = true;
      this.boards = await ajaxRequest("/user/get_user_boards", "GET");
      this.sharedBoards = await ajaxRequest("/user/get_shared_boards", "GET");
      this.loading = false;
    },
    // open right click context menu when right clicking on board
    openContextMenu(event, board) {
      this.$refs.contextMenu.$el.style.display = "block";
      this.$refs.contextMenu.$el.style.left = event.pageX + "px";
      this.$refs.contextMenu.$el.style.top = event.pageY + "px";
      this.selectedBoard = board;
    },
    // hide context menu when clicking anywhere else
    hideContextMenu() {
      this.$refs.contextMenu.$el.style.display = "none";
    },
    // delete board from js object
    deleteBoard(board) {
      Vue.delete(this.boards, this.boards.indexOf(board));
    },
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
