#version 300 es

precision mediump int;
precision mediump float;

in ivec3 vertexPosition;
in vec3  vertexNormal;
in vec4  vertexColor;

in mat4  instanceMatrices;
in mat4 instanceNormalMatrices;

uniform mat4 vertexQuantizationMatrix;
uniform mat4 projectionMatrix;
uniform mat4 viewNormalMatrix;
uniform mat4 viewMatrix;

uniform LightData {
	vec3 dir;
	vec3 color;
	vec3 ambientColor;
	float intensity;
} lightData;

out mediump vec4 color;

void main(void) {

  vec4 floatVertex = vertexQuantizationMatrix * vec4(float(vertexPosition.x), float(vertexPosition.y), float(vertexPosition.z), 1);
  vec3 viewNormal = normalize(vec3( viewNormalMatrix * instanceNormalMatrices * vec4(vertexNormal, 0.0)));
  float lambertian = max(dot(viewNormal, normalize(lightData.dir)), 0.0);

  gl_Position = projectionMatrix * viewMatrix * instanceMatrices * floatVertex;
  color = vec4(lambertian * vertexColor.rgb, vertexColor.a);
}