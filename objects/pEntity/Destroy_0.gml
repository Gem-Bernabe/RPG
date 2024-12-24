//
if (entityFragmentCount > 0 ) {
	fragmaentArray = array_create(entityFragmentCount, entityFragment);
	DropItems(x,y,fragmaentArray);
}

if (entityDroplist != -1) {
	DropItems(x,y,entityDroplist);
}