<template>
  <div id="app">
    <div id="header">
      <router-link to="/" exact>異動連2.0（仮）</router-link>
    </div>
    <el-row>
      <el-col :offset="1" :span="2">
        <el-menu
          default-activate="1"
          class="el-menu-vertical"
          router="false"
          @open="handleOpen"
          @close="handleClose">
          <el-submenu index="1">
            <template slot="title">
              <span>境遇が変わったとき</span>
            </template>
            <el-menu-item index="1-1">職場異動</el-menu-item>
            <el-menu-item index="1-2">事業所・TEC移動</el-menu-item>
            <el-menu-item index="1-2">フロア・座席移動</el-menu-item>
            <el-menu-item index="1-3">出向</el-menu-item>
            <el-menu-item index="1-4">産休</el-menu-item>
            <el-menu-item index="1-5">海外赴任</el-menu-item>
            <el-menu-item index="1-6">海外留学</el-menu-item>
            <el-menu-item index="1-7">時短勤務</el-menu-item>
            <el-menu-item index="1-8">夫婦組合員</el-menu-item>
          </el-submenu>
          <el-submenu index="2">
            <template slot="title">
              <span>役割が変わったとき</span>
            </template>
            <el-menu-item index="2-1">職場委員</el-menu-item>
            <el-menu-item index="2-2">代議員</el-menu-item>
          </el-submenu>
          <el-submenu index="3">
            <template slot="title">
              <span>共済金を申請するとき</span>
            </template>
            <el-menu-item index="3-1">結婚</el-menu-item>
            <el-menu-item index="3-2">出産</el-menu-item>
            <el-menu-item index="3-3">小学校入学</el-menu-item>
            <el-menu-item index="3-4">転籍・退職</el-menu-item>
            <el-menu-item index="3-5">I6・M6昇格</el-menu-item>
            <el-menu-item index="3-6">災害</el-menu-item>
            <el-menu-item index="3-7">入院</el-menu-item>
            <el-menu-item index="3-8">死亡</el-menu-item>
          </el-submenu>
          <el-submenu index="4">
            <template slot="title">
              <span>相談したいとき</span>
            </template>
            <el-menu-item index="4-1">会社生活</el-menu-item>
            <el-menu-item index="4-2">職場環境</el-menu-item>
          </el-submenu>
          <el-menu-item index="inquiry">
            <i class="el-icon-message"></i>
            <span>お問い合わせ</span>
          </el-menu-item>
          <el-menu-item index="usage">
            <i class="el-icon-question"></i>
            <span>使い方</span>
          </el-menu-item>
        </el-menu>
      </el-col>
      <el-col :offset="3" :span="15">
        <router-view/>
      </el-col>
    </el-row>
    <div id="footer">
      Copyright (C) 2018 Sony Central Labor Union. All rights reserved.
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
  data () {
    return {
    }
  },
  methods: {
    handleOpen (key, keyPath) {
      console.log(key, keyPath)
    },
    handleClose (key, keyPath) {
      console.log(key, keyPath)
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
.el-menu-vertical {
  width: 250px;
  min-height: 400px;
}
a, a:visited{
  text-decoration: none;
  color: black;
}
#header {
  font-size: 30px;
  text-align: left;
  font-weight: bolder;
  height: 50px;
  width: 100%;
  background-color: orange;
  position: fixed;
  top: 0;
  z-index: 1;
}
#footer {
  height: 20px;
  width: 100%;
  background-color: darkgray;
  position: fixed;
  bottom: 0;
  z-index: 1;
}
</style>
