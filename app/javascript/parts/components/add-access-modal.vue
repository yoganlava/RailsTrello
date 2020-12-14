<template>
  <div class="modal" :class="{ 'is-active': value }">
    <div class="modal-background"></div>
    <div class="modal-card">
      <header class="modal-card-head">
        <p class="modal-card-title">Add new user to board</p>
        <button class="delete" aria-label="close" @click="toggle"></button>
      </header>
      <section class="modal-card-body">
        <p>Email of user to be added</p>
        <input class="input" type="text" placeholder="Name" v-model="email" />
      </section>
      <footer class="modal-card-foot is-centered edit-footer">
        <button class="button is-success" @click="addAccess">Add</button>
        <button class="button" @click="toggle">Cancel</button>
      </footer>
    </div>
  </div>
</template>

<script>
import { ajaxRequest, toastData } from "../../plugins/utils";

export default {
  props: ["value"],
  data: () => ({
    email: "",
  }),
  methods: {
    // toggle access modal
    toggle() {
      this.$emit("input", !this.value);
    },
    // send request to add board access if email is not empty and then toast the result
    async addAccess() {
      if (this.email == ""){
          toastData({error: "Fill in all the required fields"})
          return
        }

      let data = await ajaxRequest(
        "/board_access/add_access",
        {
            email: this.email,
            board_id: this.$route.params.id
        },
        "POST"
      );
      toastData(data);
    },
  },
};
</script>

<style scoped>
.modal-card-body {
  line-height: 100px;
}
</style>
