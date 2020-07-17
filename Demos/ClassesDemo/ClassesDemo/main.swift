// initialize new class
var skeleton1 = Enemy(health: 100, attackStrength: 10);

print("enemy1 health: \(skeleton1.health)")
skeleton1.move();
skeleton1.attack();

// classes are passed by reference
let skeleton2 = skeleton1;

skeleton1.takeDamage(amount: 2)

print(skeleton1.health);
print(skeleton2.health)
