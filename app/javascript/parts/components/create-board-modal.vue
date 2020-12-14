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
        <p>Custom URL*</p>
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
    // toggle modal
    toggle: function() {
      this.$emit("input", !this.value);
    },
    // send create board request only if name, color and custom_url are not empty and colour is valid
    // then toast the output and refresh the boards
    createBoard: async function() {
      if (this.name == "" || this.color == "" || this.custom_url == "") {
        toastData({ error: "Fill in all the required fields" });
        return;
      }

      var s = new Option().style;
      s.color = this.color;

      if (!(s.color == this.color)) {
        toastData({ error: "Invalid Colour" });
        return;
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
      this.toggle();
      this.$emit("refresh");
    },
  },
};
</script>

<style scoped>
.modal-card-body {
  line-height: 100px;
}
</style>
