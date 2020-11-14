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
];

export default new VueRouter({
    mode: "history",
    routes,
});