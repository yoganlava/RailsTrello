<template>
  <div class="modal" :class="{ 'is-active': value }">
    <div class="modal-background"></div>
    <div class="modal-card">
      <header class="modal-card-head">
        <p class="modal-card-title">Create a new board</p>
        <button class="delete" aria-label="close" @click="toggle"></button>
      </header>
      <section class="modal-card-body">
        <p>Name*</p>
        <input class="input" type="text" placeholder="Name" v-model="name" />
        <p>Colour* (hex or name)</p>
        <input class="input" type="text" placeholder="Colour" v-model="color" />
        <p>Image Cover</p>
        <input class="input" type="text" placeholder="Cover" v-model="image" />
        <p>Custom URL</p>
        <input
          class="input"
          type="text"
          placeholder="Custom Url"
          v-model="custom_url"
        />
      </section>
      <footer class="modal-card-foot is-centered edit-footer">
        <button class="button is-success" @click="createBoard">Create</button>
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
    name: "",
    custom_url: "",
    color: "",
    image: "",
  }),
  methods: {
    toggle: function() {
      this.$emit("input", !this.value);
    },
    createBoard: async function() {
      if (this.name == "" || this.color == ""){
        toastData({error: "Fill in all the required fields"})
        return
      }

      let data = await ajaxRequest(
        "/board",
        {
          board: {
            name: this.name,
            custom_url: this.custom_url,
            color: this.color,
            image: this.image,
          },
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
