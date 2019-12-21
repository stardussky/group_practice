/* eslint-disable */
import * as THREE from 'three'
import GLTFLoader from 'three-gltf-loader'
import { CSS2DRenderer } from 'three-css2drender'
import transformModel from './transformModel'
import stats from 'three-stats'
import { Particle, RainDrop } from './particleSystem'
import { CircleButton } from './button'
import { TimelineMax } from 'gsap'
const OrbitControls = require('three-orbitcontrols')
const textureLoader = new THREE.TextureLoader()
let scene, renderer, labelRenderer, camera, cameraControl, width, height, aspect, animation
let rendererStatus, skyBox, particle
let statsUI
const dayTimeTextures = ['mat_ft.jpg', 'mat_bk.jpg', 'mat_up.jpg', 'mat_dn.jpg', 'mat_rt.jpg', 'mat_lf.jpg']
const nightTimeTextures = ['mat_ft_n.jpg', 'mat_bk_n.jpg', 'mat_up_n.jpg', 'mat_dn_n.jpg', 'mat_rt_n.jpg', 'mat_lf_n.jpg']
const rainTimeTextures = ['mat_ft_r.jpg', 'mat_bk_r.jpg', 'mat_up_r.jpg', 'mat_dn_r.jpg', 'mat_rt_r.jpg', 'mat_lf_r.jpg']
export function init (refs, vm) {
  scene = new THREE.Scene()
  renderer = new THREE.WebGLRenderer({
    antialias: true
  })
  renderer.setSize(width, height)
  renderer.setPixelRatio(devicePixelRatio)
  renderer.setClearColor(0x000000, 1)
  labelRenderer = new CSS2DRenderer()
  labelRenderer.setSize(width, height)
  labelRenderer.domElement.style.position = 'absolute'
  labelRenderer.domElement.style.top = 0
  labelRenderer.domElement.style.outline = 'none'
  labelRenderer.domElement.style.zIndex = '0'
  refs.threeJs.appendChild(labelRenderer.domElement)
  refs.threeJs.appendChild(renderer.domElement)

  camera = new THREE.PerspectiveCamera(45, aspect, 1, 5000)
  camera.position.set(0, 400, 800)
  cameraControl = new OrbitControls(camera, labelRenderer.domElement)
  cameraControl.enableDamping = true
  cameraControl.dampingFactor = 0.005
  cameraControl.autoRotate = true
  cameraControl.autoRotateSpeed = 1
  cameraControl.minDistance = 400
  cameraControl.maxDistance = 600

  const globalLight = new THREE.AmbientLight(0xffffff, 0.85)
  const directionalLight = new THREE.DirectionalLight(0xffffff, 0.2)
  directionalLight.position.set(500, 400, 0)
  scene.add(globalLight, directionalLight)

  const loader = new GLTFLoader()
  loader.load(
    './model/model.glb',
    (gltf) => {
      let mesh = transformModel(gltf.scene)
      mesh.position.y = -80
      mesh.rotation.x = Math.PI * 0.5
      scene.add(mesh)
    },
    (xhr) => {
      // console.log(`${(xhr.loaded / xhr.total * 100)}% loaded`)
    },
    (error) => {
      console.error('An error happened', error)
    }
  )

  // eventListener
  const buttons = []
  for (let key in refs) {
    if (refs[key].className === 'button')buttons.push(refs[key].dataset.path)
  }
  let tempObj
  const pmBtn = new CircleButton(0, 30, 0, refs.projectManagement)
  const clockBtn = new CircleButton(90, 30, -100, refs.clock)
  const shopBtn = new CircleButton(-35, -80, -40, refs.shop)
  const loginBtn = new CircleButton(20, 180, 130, refs.login)
  scene.add(
    pmBtn.button, pmBtn.fontLabel,
    clockBtn.button, clockBtn.fontLabel,
    shopBtn.button, shopBtn.fontLabel,
    loginBtn.button, loginBtn.fontLabel
  )
  refs.threeJs.addEventListener('mousemove', function (e) {
    let currentObj = getCurrentObj(e)
    if (buttons.indexOf(currentObj.name) !== -1) {
      document.documentElement.style.cursor = 'pointer'
      let timeline = new TimelineMax()
      timeline.to(currentObj.scale, 1, { x: 2, y: 2, z: 2 })
      tempObj = currentObj
    } else {
      document.documentElement.style.cursor = 'auto'
      if (tempObj) {
        let timeline = new TimelineMax()
        timeline.to(tempObj.scale, 1, { x: 1, y: 1, z: 1 })
      }
    }
  })
  refs.threeJs.addEventListener('click', function (e) {
    let currentObj = getCurrentObj(e)
    if (buttons.indexOf(currentObj.name) !== -1) {
      vm.$router.push({ path: currentObj.name })
    }
  })
  refs.threeJs.addEventListener('touchstart', function (e) {
    let currentObj = getCurrentObj(e)
    if (buttons.indexOf(currentObj.name) !== -1) {
      vm.$router.push({ path: currentObj.name })
    }
  })

  // debugger
  // statsUI = new stats.Stats()
  // refs.stats.append(statsUI.domElement)
  // var directionalLightHelper = new THREE.DirectionalLightHelper(directionalLight);
  // scene.add(directionalLightHelper);
  // var axesHelper = new THREE.AxesHelper(5);
  // scene.add(axesHelper);

  render()
}
export function handleWindowResize () {
  width = innerWidth
  height = innerHeight
  renderer.setSize(width, height)
  labelRenderer.setSize(width, height)
  camera.aspect = width / height
  camera.updateProjectionMatrix()
}
export function changeRenderer (weather) {
  if (rendererStatus)scene.remove(skyBox, particle.particleSystem)
  if (rendererStatus === 'rainy')scene.remove(particle.flashLight)
  switch (weather) {
    case 'day':
      particle = new Particle(0.8, 0.3, 0.3)
      createSkyBox(dayTimeTextures)
      rendererStatus = 'day'
      break
    case 'night':
      particle = new Particle(0.3, 0.8, 0.8)
      createSkyBox(nightTimeTextures)
      rendererStatus = 'night'
      break
    case 'rainy':
      particle = new RainDrop()
      scene.add(particle.flashLight)
      createSkyBox(rainTimeTextures)
      rendererStatus = 'rainy'
  }
  scene.add(particle.particleSystem)
}
function createSkyBox (texture) {
  const boxTexture = texture.reduce((prev, mat) => {
    let texture = new THREE.MeshBasicMaterial({
      map: textureLoader.load(`${require(`@/assets/skybox/${mat}`)}`)
    })
    texture.side = THREE.BackSide
    prev.push(texture)
    return prev
  }, [])
  const skyBoxGeo = new THREE.BoxGeometry(2500, 2500, 2500)
  skyBox = new THREE.Mesh(skyBoxGeo, boxTexture)
  scene.add(skyBox)
}
function getCurrentObj (e) {
  let mouse = new THREE.Vector2()
  let raycaster = new THREE.Raycaster()
  let currentObj
  if (e.type === 'touchstart') {
    mouse.x = (e.targetTouches[0].pageX / innerWidth) * 2 + -1
    mouse.y = -(e.targetTouches[0].pageY / innerHeight) * 2 + 1
  } else {
    mouse.x = (e.clientX / renderer.domElement.clientWidth) * 2 - 1
    mouse.y = -(e.clientY / renderer.domElement.clientHeight) * 2 + 1
  }
  raycaster.setFromCamera(mouse, camera)
  let intersects = raycaster.intersectObjects(scene.children, true)
  if (intersects.length > 0) {
    currentObj = intersects[0].object
    if (currentObj.parent.type !== 'Scene') {
      while (currentObj.parent.type !== 'Scene') {
        currentObj = currentObj.parent
      }
    }
  }
  return currentObj
}
function render () {
  if (rendererStatus)particle.update()
  cameraControl.update()
  renderer.render(scene, camera)
  labelRenderer.render(scene, camera)
  animation = requestAnimationFrame(render)

  // debugger
  // statsUI.update()
}
export { animation }
