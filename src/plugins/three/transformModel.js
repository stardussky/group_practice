import * as THREE from 'three'
export default (model) => {
  const meshArr = []
  const materialArr = []
  const geometry = new THREE.Geometry()
  model.traverse(child => {
    if (child.isMesh) {
      meshArr.push(child)
      materialArr.push(child.material)
    }
  })
  meshArr.forEach((mesh, i) => {
    mesh.updateMatrix()
    geometry.merge(new THREE.Geometry().fromBufferGeometry(mesh.geometry), mesh.matrix, i)
  })
  return new THREE.Mesh(geometry, materialArr)
}
