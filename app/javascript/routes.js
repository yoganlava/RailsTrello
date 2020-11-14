import VueRouter from 'vue-router'
const routes = [{
    path: '/',
    component: () =>
        import ("./parts/users")
}]

export default new VueRouter({
    mode: 'history',
    routes
});