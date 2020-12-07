import Vue from 'vue'
import Vuex from 'vuex'
import { ajaxRequest } from './utils'
import Cookie from 'js-cookie'

Vue.use(Vuex)


const store = new Vuex.Store({
    state: {
        user: {}
    },
    mutations: {
        updateUserState(state, { user }) {
            console.log("GET USER");
            state.user = user;
            console.log(state.user);
        }
    },
    actions: {
        async updateUserStateAsync({ commit }) {
            if (!Cookie.get("jwt"))
                return
            let res = await ajaxRequest("/get_user_info", "GET");
            if (!res.error)
                commit("updateUserState", {
                    user: res
                })
            else
                Cookie.remove("jwt")
            console.log()
        }
    }
})

export default store;