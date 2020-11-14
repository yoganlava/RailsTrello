<template>
  <div class="form">
    <div class="user-form">
      <h1 class="title" style="text-align: center">Register</h1>
      <div class="field">
        <label class="label">Username</label>
        <div class="control">
          <input class="input" type="text" placeholder="Username" />
        </div>
      </div>
      <div class="field">
        <label class="label">Password</label>
        <div class="control">
          <input class="input" type="password" placeholder="Password" />
        </div>
      </div>
      <div class="control center-button">
        <button class="button is-link" @click="register">Register</button>
      </div>
      <div>
        <p class="error-message"></p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  methods: {
    register: function() {
      console.log("Registered")
      console.log(process.env);
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
  max-width: 500px;
  padding: 10px;
  border-radius: 10px;
  box-shadow: 0 15px 35px 0 rgba(60, 66, 87, 0.12),
    0 5px 15px 0 rgba(0, 0, 0, 0.12);
}

.field {
  text-align: center;
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
