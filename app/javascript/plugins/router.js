import Vue from 'vue';
import VueRouter from 'vue-router';
import store from "./store";

Vue.use(VueRouter);

const routes = [{
        path: "/",
        component: () =>
            import ("../parts/index"),
    },
    {
        path: "/login",
        component: () =>
            import ("../parts/login"),
    },
    {
        path: "/register",
        component: () =>
            import ("../parts/register"),
    },
    {
        path: "/home",
        component: () =>
            import ("../parts/home")
    },
    {
        path: "/board/:id",
        component: () =>
            import ("../parts/board/_id"),
    },
    {
        path: "/contact",
        component: () =>
            import ("../parts/contact"),
    },
];
const router = new VueRouter({
    // mode: "history",
    routes
});

router.beforeEach(async(to, from, next) => {
    await store.dispatch('updateUserStateAsync');
    next();
})

export default router;