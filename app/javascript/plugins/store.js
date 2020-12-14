import Vue from "vue";
import Vuex from "vuex";
import { ajaxRequest } from "./utils";
import Cookie from "js-cookie";

Vue.use(Vuex);

const store = new Vuex.Store({
    state: {
        user: {},
    },
    mutations: {
        updateUserState(state, { user }) {
            state.user = user;
        },
    },
    actions: {
        async updateUserStateAsync({ commit }) {
            if (!Cookie.get("jwt")) {
                commit("updateUserState", {
                    user: {},
                });
                return;
            }
            let res;
            try {
                res = await ajaxRequest("/user/get_user_info", "GET");
            } catch (e) {
                commit("updateUserState", {
                    user: {},
                });
                return;
            }
            if (!res.error)
                commit("updateUserState", {
                    user: res,
                });
            else Cookie.remove("jwt");
        },
    },
});

export default store;