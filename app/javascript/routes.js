import VueRouter from "vue-router";
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
            import ("./parts/home"),
    },
    {
        path: "/board/:id",
        component: () =>
            import ("./parts/board/_id.vue")
    }
];

export default new VueRouter({
    mode: "history",
    routes,
});