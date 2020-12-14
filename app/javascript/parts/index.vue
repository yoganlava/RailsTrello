<template>
  <div>
    <section class="intro">
      <div class="blurb-div">
        <div>
          <h1 class="blurb-title">
            Work collaboratively with others and get work done!
          </h1>
          <p class="blurb-text">
            Use our service to organise and prioritise in a simple and fun way!
          </p>
        </div>
        <img class="blurb-img" src="assets/images/blurb.png" alt="blurb" />
      </div>
    </section>
    <section class="main">
      <div class="main-div">
        <div>
          <h1 class="start-text">
            Start Now!
          </h1>
        </div>
        <router-link class="button is-link" to="/register">
          Click here to sign up!
        </router-link>
      </div>
    </section>
  </div>
</template>
<script>
import Vue from "vue";
import { toast } from "bulma-toast";
export default {};
</script>

<style scoped>
.blurb-div {
  display: inline-flex;
  margin-left: auto;
  margin-right: auto;
  color: white;
  padding: 15px;
}

.main-div {
  margin-left: auto;
  margin-right: auto;
  color: black;
  padding: 15px;
}

.main {
  text-align: center;
}

.blurb-img {
  width: 500px;
  height: 420px;
}

.start-text {
  font-weight: 500;
  font-size: 48px;
}

.blurb-title {
  font-weight: 500;
  font-size: 48px;
}

.blurb-text {
  font-weight: 300;
  font-size: 25px;
}

.intro {
  background: linear-gradient(135deg, #0079bf, #5067c5);
}
</style>
