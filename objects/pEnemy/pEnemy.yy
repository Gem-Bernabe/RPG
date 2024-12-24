{
  "$GMObject":"",
  "%Name":"pEnemy",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":{"name":"oPlayer","path":"objects/oPlayer/oPlayer.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"pEnemy",
  "overriddenProperties":[
    {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"pEntity","path":"objects/pEntity/pEntity.yy",},"propertyId":{"name":"entityCollision","path":"objects/pEntity/pEntity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"False",},
  ],
  "parent":{
    "name":"Enemies",
    "path":"folders/Objects/Entities/Enemies.yy",
  },
  "parentObjectId":{
    "name":"pEntity",
    "path":"objects/pEntity/pEntity.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"enemyWanderDistance","filters":[],"listItems":[],"multiselect":false,"name":"enemyWanderDistance","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"32","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemySpeed","filters":[],"listItems":[],"multiselect":false,"name":"enemySpeed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0.75","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyAggroRadius","filters":[],"listItems":[],"multiselect":false,"name":"enemyAggroRadius","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"48","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyAttackRadius","filters":[],"listItems":[],"multiselect":false,"name":"enemyAttackRadius","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"16","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyHP","filters":[],"listItems":[],"multiselect":false,"name":"enemyHP","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyForceTouch","filters":[],"listItems":[],"multiselect":false,"name":"enemyForceTouch","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"32","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyDamageTouch","filters":[],"listItems":[],"multiselect":false,"name":"enemyDamageTouch","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0.5","varType":0,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":null,
  "spriteMaskId":null,
  "visible":true,
}