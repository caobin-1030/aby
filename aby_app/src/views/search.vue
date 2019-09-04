<template>
	<div class="search-1">
		<div class="top1">
			<div class="search1">
				<span @click="return1" class="iconfont icon-zuo"></span>
				<input type="text" @keyup.13="searchChange" v-model="search">
			</div>
		</div>
		<div class="kong"></div>
		<div v-if="stat.code>0">
			<router-link :to="`/HDetail/${item.hid}`"  v-for="(item,i) of data" :key="i">
			<div class="for-car">
				<span id="aixin" @click="cla" class="iconfont icon-aixin"></span>
				<div class="for-carousel"><carousel :height="`150px`" :pics="images[i]"></carousel></div>
				<div class="for-xia">
					<p class="h_type">{{item.h_type}}·{{item.city}}</p>
					<p class="title">{{item.title}}</p>
					<p class="pingjia">*****<span>45</span>条评论</p>
					<hr>
					<p class="price">￥<span>{{item.price}}</span>/晚</p>
				</div>
			</div>
			</router-link>
		</div>
		<div v-else class="areaNotice">暂无该地区房源</div>
	</div>
</template>
<script>
	import carousel from "../components/carousel"
	export default {
		data() {
			return {
				data:[],
				images:[],
				search:"",
				stat:0
			}
		},
		components:{carousel},
		props:{
			area:{default:""}
		},
		created() {
			this.load();
		},
		methods: {
			searchChange(){
				this.$router.push(`/Search/${this.search}`)
			},
			load(){
				this.search=this.area
				if(this.search=="房源"){
					this.axios.get(
					"/house/houseByTime",
						{params:{
							pno:1,
							pagesize:9
						}}
					).then(res=>{
						console.log(res.data.data);
						console.log(res.data);
						this.stat=res.data
						this.data=res.data.data;
						for(var i=0;i<this.data.length;i++){
							this.images[i]=this.data[i].pic_address.split(",")
						}
					}).catch(err=>{

					})
				}else{
					this.axios.get(
					"/house/houseByArea",
						{params:{
							area:this.search,
							pno:1,
							pagesize:9
						}}
					).then(res=>{
						console.log(res);
						this.stat=res.data
						this.data=res.data.data;
						for(var i=0;i<this.data.length;i++){
							this.images[i]=this.data[i].pic_address.split(",")
						}
					}).catch(err=>{

					})
				}
			},
			return1:function(){
				this.$router.push("/Home")
			},
			cla:function(){
				var a=document.getElementById("aixin");
				a.classList.replace("iconfont icon-aixin","iconfont icon-aixin1")
			}
		},
		watch: {
			'$route'(){
				this.search=this.$route.params.area;
				this.load();
			}
		},
	}
</script>
<style scoped>
	.kong{
		height: 30px;;
	}
	.search-1{
		display: block;
		width: 90%;
		margin: 0 auto;
	}
	.top1{
		width: 100%;
		background: #fff;
		position: fixed;
		top:0;
		left:0;
		z-index: 999;
	}
	.search1{
		width: 90%;
		margin: 0 auto;
		height: 30px;
		line-height: 30px;
		border: 1px solid #eee;
		margin-top: 5px;
		margin-bottom: 5px;
		border-radius: 5px;
		box-shadow:  5px 5px 10px 5 black;
	}
	.search1>span{
		margin-left: 10px;
	}
	.for-car{
		margin-top:20px;
		border: 1px solid #eee;
		position: relative;
	}
	.search1>input{
		margin-left: 10px;
	}
	.for-xia{
		margin-top: 20px; 
	}
	.areaNotice{
		margin-top:30px;
		text-align:center;
	}
	hr{
		color: #eee;
	}
	.h_type{
		font-size: 8px;
		color: sienna;
		margin-left: 10px;
	}
	.title{
		text-overflow: ellipsis;
		overflow: hidden;
		margin-top: 8px;
		margin-left: 10px;

	}
	.price{
		font-size: 14px;
		margin-top: 10px;
		display: inline-block;
		margin-left: 10px;
		margin-bottom: 10px;
	}
	.price>span{
		font-weight: 700;
	}
	.pingjia{
		margin-top: 10px;
		margin-left: 10px;
		margin-bottom: 5px;
	}
	.pingjia>span{
		font-weight: 700;
	}
	#aixin{
		position: absolute;
		right: 20px;
		top:5px;
	}
	.wei{
		display: inline;
	}
	.xuanzhong{
		display: none
	}
</style>

