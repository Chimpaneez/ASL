state("DMC-DevilMayCry", "1.0")
{
	int loading: "DMC-DevilMayCry.exe", 0x273F0F8, 0x5B4;
}

state("DMC-DevilMayCry", "Current")
{
	int loading: "DMC-DevilMayCry.exe", 0x2759300, 0x5B4;
}

init
{
	vars.isLoading = false;
	switch(modules.First().ModuleMemorySize)
	{
		case 47788032:
			version = "1.0";
			break;
		default:
			version = "Current";
			break;
	}
}


isLoading
{
	return current.loading != 0;
}
