
function DialogueResponses(argument0){
	
	switch (argument0) {
		
		case 0: break;
		case 1: NewTextBox("You gave response A!",1); break;
		case 2: NewTextBox("You gave response B! Any further response?", 1,["3:Yes","0:No"]); break;
		case 3: NewTextBox("Thanks for your response!",0); break;
		case 4: {
			NewTextBox("Thanks!",2);
			NewTextBox("I think left it in that\nscary cave to the north east!",2);
			global.questStatus[? "TheHatQuest"] = 1;
		}break;
		case 5:	NewTextBox(":(",2); break;
		case 6: PurchaseItem(activate.item, activate.itemAmount, activate.itemCost); break;
		default: break;
	}
	
	
}