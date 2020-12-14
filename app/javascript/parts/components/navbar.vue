<template>
  <nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <router-link to="/" class="navbar-item">
        <h1 class="title">RailsTrello</h1>
      </router-link>
      <a
        role="button"
        class="navbar-burger burger"
        aria-label="menu"
        aria-expanded="false"
        data-target="navbar"
        :class="{'is-active': isActive}"
        @click="toggle"
      >
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>
    <div id="navbar" class="navbar-menu" :class="{'is-active': isActive}">
      <div class="navbar-start">
        <!-- only show Your boards if logged in -->
        <router-link
          v-if="$store.state.user.email"
          class="navbar-item"
          to="/home"
        >
          Your boards
        </router-link>
        <router-link class="navbar-item" to="/contact">
          Contact Me
        </router-link>
      </div>
      <div class="navbar-end">
        <!-- only show sign up and login button when not logged in, else show logout -->
        <div v-if="!$store.state.user.email" class="navbar-item">
          <div class="buttons">
            <router-link to="/register" class="button is-primary">
              <strong>Sign up</strong>
            </router-link>
            <router-link to="/login" class="button is-light">
              Log in
            </router-link>
          </div>
        </div>
        <div v-else class="navbar-item">
          <div class="buttons">
            <button class="button is-primary" @click="logout">
              <strong>Logout</strong>
            </button>
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
import Cookies from "js-cookie";
export default {
  data: () => ({
    isActive: false
  }),
  methods: {
    // remove token when logging out and update user state
    async logout() {
      Cookies.remove("jwt");
      await this.$store.dispatch("updateUserStateAsync");
      this.$router.push("/");
    },
    // toggle mobile hamburger icon
    toggle() {
      this.isActive = !this.isActive;
    }
  },
};
</script>
