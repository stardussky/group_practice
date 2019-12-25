
import * as THREE from 'three'
import { CSS2DObject } from 'three-css2drender'
import { TweenMax } from 'gsap'
class CircleButton {
  constructor (x, y, z, id, color = 0x8acede) {
    this.x = x
    this.y = y
    this.z = z
    this.id = id
    this.color = color
    this.opacity = []
    this.scale = []
    this.button = new THREE.Group()
    this.button.name = this.id.dataset.path
    for (let i = 0; i < 5; i++) {
      let circleGeo = new THREE.SphereBufferGeometry(1, 20, 20)
      let circleMat = new THREE.MeshBasicMaterial({
        color: this.color,
        transparent: true
      })
      let mesh = new THREE.Mesh(circleGeo, circleMat)
      this.opacity.unshift(circleMat)
      this.scale.unshift(mesh.scale)
      this.button.add(mesh)
      this.button.position.set(this.x, this.y, this.z)
    }
    this.fontLabel = new CSS2DObject(this.id)
    this.fontLabel.position.set(this.x, this.y + 20, this.z)

    TweenMax.staggerTo(
      this.opacity,
      3,
      { opacity: 0, repeat: -1 },
      0.6
    )
    TweenMax.staggerTo(
      this.scale,
      3,
      { x: 15, y: 15, z: 15, repeat: -1 },
      0.6
    )
  }
}
export { CircleButton }
