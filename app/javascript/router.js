import Vue from 'vue';
import VueRouter from 'vue-router';
import store from "./plugins/store";

Vue.use(VueRouter);


// All frontend routes
const routes = [{
        path: "/",
        component: () =>
            import ("./parts/index"),
    },
    {
        path: "/login",
        component: () =>
            import ("./parts/login"),
    },
    {
        path: "/register",
        component: () =>
            import ("./parts/register"),
    },
    {
        path: "/home",
        component: () =>
            import ("./parts/home")
    },
    {
        path: "/board/:id",
        component: () =>
            import ("./parts/board/_id"),
    },
    {
        path: "/contact",
        component: () =>
            import ("./parts/contact"),
    },
];
const router = new VueRouter({
    mode: "history",
    routes
});

// before each route, update user state to make sure we are still logged in
router.beforeEach(async(to, from, next) => {
    await store.dispatch('updateUserStateAsync');
    next();
})

export default router;