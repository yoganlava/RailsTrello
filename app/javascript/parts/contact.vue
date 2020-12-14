<template>
  <div class="form">
    <div class="user-form">
      <h1 class="title" style="text-align: center">Contact Me</h1>
      <div class="field">
        <label class="label">Name*</label>
        <div class="control">
          <input class="input" type="text" placeholder="Name" v-model="name" />
        </div>
      </div>
      <div class="field">
        <label class="label">Message*</label>
        <div class="control">
          <textarea class="textarea" v-model="message"></textarea>
        </div>
      </div>
      <div class="control center-button">
        <button class="button is-link" style="margin-right: 20px" @click="send">Send</button>
        <button class="button is-link" @click="preview">Preview</button>
      </div>
    </div>
  </div>
</template>

<script>
import { ajaxRequest, toastData } from "../plugins/utils";
export default {
  data: () => ({
    name: "",
    message: "",
  }),
  methods: {
      async send() {
        if (this.name == "" || this.message == ""){
          toastData({error: "Fill in all the required fields"})
          return
        }

        let res = await ajaxRequest("/mail/send_contact", 
        {
          name: this.name,
          message: this.message
        },
        "POST");

        toastData(res);

      },
      preview() {
        if (this.name == "" || this.message == ""){
          toastData({error: "Fill in all the required fields"})
          return
        }
        window.location = `/rails/mailers/contact_mailer/contact_email?name=${this.name}&message=${this.message}`;
      }
  }
};
</script>

<style scoped>
.form {
  display: flex;
  align-items: center;
  justify-content: center;
}

.user-form {
  max-width: 800px;
  padding: 10px;
  border-radius: 10px;
  box-shadow: 0 15px 35px 0 rgba(60, 66, 87, 0.12),
    0 5px 15px 0 rgba(0, 0, 0, 0.12);
}

.center-button {
  display: flex;
  justify-content: center;
}

.error-message {
  color: hsl(348, 100%, 61%);
  text-align: center;
  margin: 10px 0px;
}

textarea {
  width: 700px;
  height: 300px;
  resize: none;
}
</style>
