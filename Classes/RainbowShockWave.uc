//=============================================================================
// RainbowShockWave.
//=============================================================================
class RainbowShockWave extends Botpack.Shockwave;



simulated function Timer()
{

	local actor Victims;
	local float dist, MoScale;
	local vector dir;
	local Pawn VictimPawn;
	local int OldHealth;

	ShockSize =  13 * (Default.LifeSpan - LifeSpan) + 3.5/(LifeSpan/Default.LifeSpan+0.05);
	if ( Level.NetMode != NM_DedicatedServer )
	{
		if (ICount==4) spawn(class'WarExplosion2',,,Location);
		ICount++;

		if ( Level.NetMode == NM_Client )
		{
			foreach VisibleCollidingActors( class 'Actor', Victims, ShockSize*29, Location )
				if ( Victims.Role == ROLE_Authority )
				{
					dir = Victims.Location - Location;
					dist = FMax(1,VSize(dir));
					dir = dir/dist +vect(0,0,0.3); 
					if ( (dist> OldShockDistance) || (dir dot Victims.Velocity <= 0))
					{
						MoScale = FMax(0, 1100 - 1.1 * Dist);
						Victims.Velocity = Victims.Velocity + dir * (MoScale + 20);	
						Victims.TakeDamage
						(
							MoScale,
							Instigator, 
							Victims.Location - 0.5 * (Victims.CollisionHeight + Victims.CollisionRadius) * dir,
							(1000 * dir),
							'RainbowRedeemerDamage'
						);
					}
				}	
			return;
		}
	}

	foreach VisibleCollidingActors( class 'Actor', Victims, ShockSize*29, Location )
	{
		dir = Victims.Location - Location;
		dist = FMax(1,VSize(dir));
		dir = dir/dist + vect(0,0,0.3); 
		if (dist> OldShockDistance || (dir dot Victims.Velocity < 0))
		{
			MoScale = FMax(0, 1100 - 1.1 * Dist);
			VictimPawn = None;
			OldHealth = 0;
			if ( Victims.bIsPawn )
			{
				VictimPawn = Pawn(Victims);
				OldHealth = VictimPawn.Health;
				Pawn(Victims).AddVelocity(dir * (MoScale + 20));
			}
			else
				Victims.Velocity = Victims.Velocity + dir * (MoScale + 20);	
			Victims.TakeDamage
			(
				MoScale,
				Instigator, 
				Victims.Location - 0.5 * (Victims.CollisionHeight + Victims.CollisionRadius) * dir,
				(1000 * dir),
				'RainbowRedeemerDamage'
			);

			if (VictimPawn != None && VictimPawn != Instigator && OldHealth > 0 && VictimPawn.Health <= 0)
				class'Rainbow.RainbowKillMessageHelper'.static.Send(Instigator, VictimPawn, 2);
		}
	}	
	OldShockDistance = ShockSize*29;	
}




