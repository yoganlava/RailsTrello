<template>
  <div class="form">
    <div class="user-form">
      <h1 class="title" style="text-align: center">Login</h1>
      <div class="field">
        <label class="label">Email</label>
        <div class="control">
          <input
            class="input"
            type="text"
            placeholder="Email"
            v-model="email"
          />
        </div>
      </div>
      <div class="field">
        <label class="label">Password</label>
        <div class="control">
          <input
            class="input"
            type="password"
            placeholder="Password"
            v-model="password"
          />
        </div>
      </div>
      <div class="control center-button">
        <button class="button is-link" @click="login">Login</button>
      </div>
      <div>
        <p class="error-message"></p>
      </div>
    </div>
  </div>
</template>

<script>
import $ from "jquery";
export default {
  data: () => ({
    email: "",
    password: "",
  }),
  methods: {
    login: function() {
      console.log("Login");
      $.ajax({
        type: "POST",
        url: "http://localhost:3000/user_token",
        data: {
          auth: { email: this.email, password: this.password },
        },
        success: (res) => {
          console.log(data);
        },
        dataType: "json",
      });
    },
  },
};
</script>

<style scoped>
.form {
  display: flex;
  align-items: center;
  justify-content: center;
}

.user-form {
  max-width: 500px;
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
</style>
