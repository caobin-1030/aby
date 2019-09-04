import Vue from 'vue'
import Router from 'vue-router'
import HDetail from './views/detail/HDetail'
import Story from './views/story.vue'
import Abstract from "./components/hdetail/abstract"
import Sdetal from './views/Sdetal.vue'
import Remark from './components/hdetail/remark'
import HServer from './components/hdetail/server'
import Home from './views/index.vue'
import Reserve from './components/hdetail/reserve'
import Wish from './views/Wish.vue'
import Login1 from './views/Login1.vue'
import Register from './views/Register.vue'
import Me from './views/Me.vue'
import MeUpdata from './views/MeUpdate.vue'
import Date from './components/datePicker'
import Search from './views/search'

Vue.use(Router)

export default new Router({
  routes: [
    {path:"/HDetail/:hid",component:HDetail,props:true},
    {path:'/Story',component:Story},
    {path:"/HDetail/abstract/:hid",component:Abstract,props:true},
    {path:'/Sdetal/:storyid',component:Sdetal,props:true},
    {path:"/HDetail/remark/:hid",component:Remark,props:true},
    {path:"/HDetail/server",component:HServer},
    {path:"/Home",component:Home},
    {path:"/Wish",component:Wish},
    {path:"/Login1",component:Login1},
    {path:"/Register",component:Register},
    {path:"/Me",component:Me},
    {path:"/MeUpdate",component:MeUpdata},
    {path:"/HDetail/reserve/:hid",component:Reserve,props:true},
    {path:"/Date",component:Date},
    {path:"/Search/:area",component:Search,props:true}
  ]
})
