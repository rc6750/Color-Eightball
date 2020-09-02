//=============================================================================
// Color_Eightball
// Mutation created by Bog_Wraith (grave@tampabay.rr.com). 
// Use rc6750@gmail.com - email address above is no longer active
//=============================================================================
class Color_Eightball extends TournamentWeapon;

#exec MESH IMPORT MESH=C_Eightm ANIVFILE=MODELS\Eightm_a.3D  DATAFILE=MODELS\Eightm_d.3D X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=C_Eightm X=0 Y=0 Z=0 YAW=-64 ROLL=0
#exec MESH SEQUENCE MESH=C_Eightm SEQ=All      STARTFRAME=0   NUMFRAMES=169
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Select   STARTFRAME=0   NUMFRAMES=20 RATE=33 GROUP=Select
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Still    STARTFRAME=19  NUMFRAMES=1
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Idle     STARTFRAME=19  NUMFRAMES=1
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Fire1    STARTFRAME=20  NUMFRAMES=8
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Load1    STARTFRAME=28  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Rotate1  STARTFRAME=35  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Load2    STARTFRAME=42  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Fire2    STARTFRAME=49  NUMFRAMES=11
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Rotate2  STARTFRAME=60  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Load3    STARTFRAME=67  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Fire3    STARTFRAME=74  NUMFRAMES=10
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Rotate3  STARTFRAME=84  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Load4    STARTFRAME=91  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Fire4    STARTFRAME=98  NUMFRAMES=11
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Rotate4  STARTFRAME=109 NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Fire5    STARTFRAME=116 NUMFRAMES=13
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Fire6    STARTFRAME=130 NUMFRAMES=16
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Down     STARTFRAME=146 NUMFRAMES=11 
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Load5    STARTFRAME=157 NUMFRAMES=7  RATE=15 
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Rotate5  STARTFRAME=164 NUMFRAMES=7  RATE=15 
#exec MESH SEQUENCE MESH=C_Eightm SEQ=Load6    STARTFRAME=171 NUMFRAMES=6  RATE=15 

#exec MESHMAP SCALE MESHMAP=C_Eightm X=0.006 Y=0.006 Z=0.012
#exec MESHMAP SETTEXTURE MESHMAP=C_Eightm NUM=0 TEXTURE=Botpack.BoltHit.phit_a00
#exec MESHMAP SETTEXTURE MESHMAP=C_Eightm NUM=1 TEXTURE=Botpack.BoltHit.phit_a00
#exec MESHMAP SETTEXTURE MESHMAP=C_Eightm NUM=2 TEXTURE=Botpack.BoltHit.phit_a00
#exec MESHMAP SETTEXTURE MESHMAP=C_Eightm NUM=3 TEXTURE=Botpack.BoltHit.phit_a00
#exec MESHMAP SETTEXTURE MESHMAP=C_Eightm Num=4 TEXTURE=Botpack.Ammocount.MiniAmmoled

// left handed version
#exec MESH IMPORT MESH=C_EightmL ANIVFILE=MODELS\Eightm_a.3D  DATAFILE=MODELS\Eightm_d.3D UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=C_EightmL X=0 Y=0 Z=0 YAW=-64 ROLL=0
#exec MESH SEQUENCE MESH=C_EightmL SEQ=All      STARTFRAME=0   NUMFRAMES=169
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Select   STARTFRAME=0   NUMFRAMES=20 RATE=33 GROUP=Select
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Still    STARTFRAME=19  NUMFRAMES=1
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Idle     STARTFRAME=19  NUMFRAMES=1
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Fire1    STARTFRAME=20  NUMFRAMES=8
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Load1    STARTFRAME=28  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Rotate1  STARTFRAME=35  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Load2    STARTFRAME=42  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Fire2    STARTFRAME=49  NUMFRAMES=11
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Rotate2  STARTFRAME=60  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Load3    STARTFRAME=67  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Fire3    STARTFRAME=74  NUMFRAMES=10
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Rotate3  STARTFRAME=84  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Load4    STARTFRAME=91  NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Fire4    STARTFRAME=98  NUMFRAMES=11
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Rotate4  STARTFRAME=109 NUMFRAMES=7  RATE=15
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Fire5    STARTFRAME=116 NUMFRAMES=13
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Fire6    STARTFRAME=130 NUMFRAMES=16
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Down     STARTFRAME=146 NUMFRAMES=11 
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Load5    STARTFRAME=157 NUMFRAMES=7  RATE=15 
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Rotate5  STARTFRAME=164 NUMFRAMES=7  RATE=15 
#exec MESH SEQUENCE MESH=C_EightmL SEQ=Load6    STARTFRAME=171 NUMFRAMES=6  RATE=15 

#exec MESHMAP SCALE MESHMAP=C_EightmL X=0.006 Y=0.006 Z=0.012
#exec MESHMAP SETTEXTURE MESHMAP=C_EightmL NUM=0 TEXTURE=Botpack.BoltHit.phit_a00
#exec MESHMAP SETTEXTURE MESHMAP=C_EightmL NUM=1 TEXTURE=Botpack.BoltHit.phit_a00
#exec MESHMAP SETTEXTURE MESHMAP=C_EightmL NUM=2 TEXTURE=Botpack.BoltHit.phit_a00
#exec MESHMAP SETTEXTURE MESHMAP=C_EightmL NUM=3 TEXTURE=Botpack.BoltHit.phit_a00
#exec MESHMAP SETTEXTURE MESHMAP=EightmL Num=4 TEXTURE=Botpack.Ammocount.MiniAmmoled

#exec MESH IMPORT MESH=C_Eight2Pick ANIVFILE=MODELS\Eight2Pick_a.3D DATAFILE=MODELS\Eight2Pick_d.3D X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=C_Eight2Pick X=0 Y=170 Z=0 YAW=64
#exec MESH SEQUENCE MESH=C_eight2pick SEQ=All    STARTFRAME=0   NUMFRAMES=1
#exec MESH SEQUENCE MESH=C_eight2pick SEQ=Still  STARTFRAME=0   NUMFRAMES=1
#exec MESHMAP SCALE MESHMAP=C_eight2pick X=0.12 Y=0.12 Z=0.24
#exec MESHMAP SETTEXTURE MESHMAP=C_eight2pick NUM=2 TEXTURE=Botpack.BoltHit.phit_a00

// 3rd person perspective version
#exec MESH IMPORT MESH=C_EightHand ANIVFILE=MODELS\Eight2Pick_a.3D DATAFILE=MODELS\Eight2Pick_d.3D
#exec MESH ORIGIN MESH=C_EightHand X=-5 Y=-125 Z=-30 YAW=-64 
#exec MESH SEQUENCE MESH=C_EightHand SEQ=All    STARTFRAME=0   NUMFRAMES=1
#exec MESH SEQUENCE MESH=C_EightHand SEQ=Still  STARTFRAME=0   NUMFRAMES=1
#exec MESHMAP SCALE MESHMAP=C_EightHand X=0.07 Y=0.07 Z=0.14
#exec MESHMAP SETTEXTURE MESHMAP=C_EightHand NUM=2 TEXTURE=Botpack.BoltHit.phit_a00

#exec TEXTURE IMPORT NAME=GoldASMDAlt_a00 FILE=textures\GoldASMDAlt_a00.PCX GROUP="GoldASMDAlt"
#exec TEXTURE IMPORT NAME=GoldASMDAlt_a01 FILE=textures\GoldASMDAlt_a01.PCX GROUP="GoldASMDAlt"
#exec TEXTURE IMPORT NAME=GoldASMDAlt_a02 FILE=textures\GoldASMDAlt_a02.PCX GROUP="GoldASMDAlt"
#exec TEXTURE IMPORT NAME=GoldASMDAlt_a03 FILE=textures\GoldASMDAlt_a03.PCX GROUP="GoldASMDAlt"

#exec TEXTURE IMPORT NAME=GrenASMDAlt_a00 FILE=textures\GrenASMDAlt_a00.PCX GROUP="GrenASMDAlt"
#exec TEXTURE IMPORT NAME=GrenASMDAlt_a01 FILE=textures\GrenASMDAlt_a01.PCX GROUP="GrenASMDAlt"
#exec TEXTURE IMPORT NAME=GrenASMDAlt_a02 FILE=textures\GrenASMDAlt_a02.PCX GROUP="GrenASMDAlt"
#exec TEXTURE IMPORT NAME=GrenASMDAlt_a03 FILE=textures\GrenASMDAlt_a03.PCX GROUP="GrenASMDAlt"

#exec TEXTURE IMPORT NAME=RedASMDAlt_a00 FILE=textures\RedASMDAlt_a00.PCX GROUP="RedASMDAlt"
#exec TEXTURE IMPORT NAME=RedASMDAlt_a01 FILE=textures\RedASMDAlt_a01.PCX GROUP="RedASMDAlt"
#exec TEXTURE IMPORT NAME=RedASMDAlt_a02 FILE=textures\RedASMDAlt_a02.PCX GROUP="RedASMDAlt"
#exec TEXTURE IMPORT NAME=RedASMDAlt_a03 FILE=textures\RedASMDAlt_a03.PCX GROUP="RedASMDAlt"
 
#exec TEXTURE IMPORT NAME=GreyASMDAlt_a00 FILE=textures\GreyASMDAlt_a00.PCX GROUP="GreyASMDAlt"
#exec TEXTURE IMPORT NAME=GreyASMDAlt_a01 FILE=textures\GreyASMDAlt_a01.PCX GROUP="GreyASMDAlt"
#exec TEXTURE IMPORT NAME=GreyASMDAlt_a02 FILE=textures\GreyASMDAlt_a02.PCX GROUP="GreyASMDAlt"
#exec TEXTURE IMPORT NAME=GreyASMDAlt_a03 FILE=textures\GreyASMDAlt_a03.PCX GROUP="GreyASMDAlt"

#exec TEXTURE IMPORT NAME=BlueASMDAlt_a00 FILE=textures\BlueASMDAlt_a00.PCX GROUP="BlueASMDAlt"
#exec TEXTURE IMPORT NAME=BlueASMDAlt_a01 FILE=textures\BlueASMDAlt_a01.PCX GROUP="BlueASMDAlt"
#exec TEXTURE IMPORT NAME=BlueASMDAlt_a02 FILE=textures\BlueASMDAlt_a02.PCX GROUP="BlueASMDAlt"
#exec TEXTURE IMPORT NAME=BlueASMDAlt_a03 FILE=textures\BlueASMDAlt_a03.PCX GROUP="BlueASMDAlt"

#exec TEXTURE IMPORT NAME=PurpleASMDAlt_a00 FILE=textures\PurpleASMDAlt_a00.pcx GROUP="PurpleASMDAlt"
#exec TEXTURE IMPORT NAME=PurpleASMDAlt_a01 FILE=textures\PurpleASMDAlt_a01.pcx GROUP="PurpleASMDAlt"
#exec TEXTURE IMPORT NAME=PurpleASMDAlt_a02 FILE=textures\PurpleASMDAlt_a02.pcx GROUP="PurpleASMDAlt"
#exec TEXTURE IMPORT NAME=PurpleASMDAlt_a03 FILE=textures\PurpleASMDAlt_a03.pcx GROUP="PurpleASMDAlt"

var name LoadAnim[6], RotateAnim[6], FireAnim[6];
var int RocketsLoaded, ClientRocketsLoaded;
var bool bFireLoad,bTightWad, bInstantRocket, bAlwaysInstant, bClientDone, bRotated, bPendingLock;
var Actor LockedTarget, NewTarget, OldTarget;

var() globalconfig bool bRedeemer;


Replication
{
	reliable if ( bNetOwner && (Role == ROLE_Authority) )
		bInstantRocket;
}

function setHand(float Hand)
{
	Super.SetHand(Hand);

	if ( Hand == 0 )
		PlayerViewOffset.Y = 0;
	if ( Hand == 1 )
		Mesh = mesh(DynamicLoadObject("Rainbow.C_EightML", class'Mesh'));
	else
		Mesh = mesh'C_EightM';
}

function BecomeItem()
{
	local TournamentPlayer TP;

	Super.BecomeItem();
	TP = TournamentPlayer(Instigator);
	bInstantRocket = bAlwaysInstant || ( (TP != None) && TP.bInstantRocket );
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	local Color C;
	local string Temp;
	
	if ( AmmoType != None )
		Temp = String(AmmoType.AmmoAmount);

	while(Len(Temp) < 3) Temp = "0"$Temp;

	C.R = 255;
	C.G = 0;
	C.B = 0;

	Tex.DrawColoredText( 2, 10, Temp, Font'LEDFont2', C );	
}

simulated event RenderOverlays( canvas Canvas )
{
	Texture'MiniAmmoled'.NotifyActor = Self;
	Super.RenderOverlays(Canvas);
	Texture'MiniAmmoled'.NotifyActor = None;
}

simulated function PostRender( canvas Canvas )
{
	local float XScale;

	Super.PostRender(Canvas);
	bOwnsCrossHair = bLockedOn;
	if ( bOwnsCrossHair )
	{
		// if locked on, draw special crosshair
		XScale = FMax(1.0, Canvas.ClipX/640.0);
		Canvas.SetPos(0.5 * (Canvas.ClipX - Texture'Crosshair6'.USize * XScale), 0.5 * (Canvas.ClipY - Texture'Crosshair6'.VSize * XScale));
		Canvas.Style = ERenderStyle.STY_Normal;
		Canvas.DrawIcon(Texture'Crosshair6', 1.0);
		Canvas.Style = 1;	
	}
}
		
simulated function PlayLoading(float rate, int num)
{
	if ( Owner == None )
		return;
	Owner.PlayOwnedSound(CockingSound, SLOT_None, Pawn(Owner).SoundDampening);
	PlayAnim(LoadAnim[num],, 0.05);
}

simulated function PlayRotating(int num)
{
	Owner.PlayOwnedSound(Misc3Sound, SLOT_None, 0.1*Pawn(Owner).SoundDampening);
	PlayAnim(RotateAnim[num],, 0.05);
}

simulated function PlayRFiring(int num)
{
	if ( Owner.IsA('PlayerPawn') )
	{
		PlayerPawn(Owner).shakeview(ShakeTime, ShakeMag*RocketsLoaded, ShakeVert); //shake player view
		PlayerPawn(Owner).ClientInstantFlash( -0.4, vect(650, 450, 190));
	}
	if ( Affector != None )
		Affector.FireEffect();
	if ( bFireLoad )
		PlayOwnedSound(class'RocketMk2'.Default.SpawnSound, SLOT_None, 4.0*Pawn(Owner).SoundDampening);
	else
		PlayOwnedSound(AltFireSound, SLOT_None, 4.0*Pawn(Owner).SoundDampening);
	if ( bFireLoad && bInstantRocket )
		PlayAnim(FireAnim[num], 0.54, 0.05);
	else				
		PlayAnim(FireAnim[num], 0.6, 0.05);
}

simulated function PlayIdleAnim()
{
	if ( Mesh == PickupViewMesh )
		return;
	if (AnimSequence == LoadAnim[0] )
		PlayAnim('Idle',0.1,0.0);
	else
		TweenAnim('Idle', 0.5);
}

// tell bot how valuable this weapon would be to use, based on the bot's combat situation
// also suggest whether to use regular or alternate fire mode
function float RateSelf( out int bUseAltMode )
{
	local float EnemyDist, Rating;
	local bool bRetreating;
	local vector EnemyDir;
	local Pawn P;

	// don't recommend self if out of ammo
	if ( AmmoType.AmmoAmount <=0 )
		return -2;

	// by default use regular mode (rockets)
	bUseAltMode = 0;
	P = Pawn(Owner);
	if ( P.Enemy == None )
		return AIRating;

	// if standing on a lift, make sure not about to go around a corner and lose sight of target
	// (don't want to blow up a rocket in bot's face)
	if ( (P.Base != None) && (P.Base.Velocity != vect(0,0,0))
		&& !P.CheckFutureSight(0.1) )
		return 0.1;

	EnemyDir = P.Enemy.Location - Owner.Location; 
	EnemyDist = VSize(EnemyDir);
	Rating = AIRating;

	// don't pick rocket launcher is enemy is too close
	if ( EnemyDist < 360 )
	{
		if ( P.Weapon == self )
		{
			// don't switch away from rocket launcher unless really bad tactical situation
			if ( (EnemyDist > 230) || ((P.Health < 50) && (P.Health < P.Enemy.Health - 30)) )
				return Rating;
		}
		return 0.05 + EnemyDist * 0.001;
	}

	// increase rating for situations for which rocket launcher is well suited
	if ( P.Enemy.IsA('StationaryPawn') )
		Rating += 0.4;

	// rockets are good if higher than target, bad if lower than target
	if ( Owner.Location.Z > P.Enemy.Location.Z + 120 )
		Rating += 0.25;
	else if ( P.Enemy.Location.Z > Owner.Location.Z + 160 )
		Rating -= 0.35;
	else if ( P.Enemy.Location.Z > Owner.Location.Z + 80 )
		Rating -= 0.05;

	// decide if should use alternate fire (grenades) instead
	if ( (Owner.Physics == PHYS_Falling) || Owner.Region.Zone.bWaterZone )
		bUseAltMode = 0;
	else if ( EnemyDist < -1.5 * EnemyDir.Z )
		bUseAltMode = int( FRand() < 0.5 );
	else
	{
		// grenades are good covering fire when retreating
		bRetreating = ( ((EnemyDir/EnemyDist) Dot Owner.Velocity) < -0.7 );
		bUseAltMode = 0;
		if ( bRetreating && (EnemyDist < 800) && (FRand() < 0.4) )
			bUseAltMode = 1;
	}
	return Rating;
}

// return delta to combat style while using this weapon
function float SuggestAttackStyle()
{
	local float EnemyDist;

	// recommend backing off if target is too close
	EnemyDist = VSize(Pawn(Owner).Enemy.Location - Owner.Location);
	if ( EnemyDist < 600 )
	{
		if ( EnemyDist < 300 )
			return -1.5;
		else
			return -0.7;
	}
	else
		return -0.2;
}

function Fire( float Value )
{
	local TournamentPlayer TP;

	bPointing=True;
	if ( AmmoType == None )
	{
		// ammocheck
		GiveAmmo(Pawn(Owner));
	}
	if ( AmmoType.UseAmmo(1) )
	{
		TP = TournamentPlayer(Instigator);
		bCanClientFire = true;
		bInstantRocket = bAlwaysInstant || ( (TP != None) && TP.bInstantRocket );
		if ( bInstantRocket )
		{
			bFireLoad = True;
			RocketsLoaded = 1;
			GotoState('');
			GotoState('FireRockets', 'Begin');
		}
		else if ( Instigator.IsA('Bot') )
		{
			if ( LockedTarget != None )
			{
				bFireLoad = True;
				RocketsLoaded = 1;
				Instigator.bFire = 0;
				bPendingLock = true;
				GotoState('');
				GotoState('FireRockets', 'Begin');
				return;
			}
			else if ( (NewTarget != None) && !NewTarget.IsA('StationaryPawn')
				&& (FRand() < 0.8)
				&& (VSize(Instigator.Location - NewTarget.Location) > 400 + 400 * (1.25 - TimerCounter) + 1300 * FRand()) )
			{
				Instigator.bFire = 0;
				bPendingLock = true;
				GotoState('Idle','PendingLock');
				return;
			}
			else if ( !Bot(Owner).bNovice 
					&& (FRand() < 0.7)
					&& IsInState('Idle') && (Instigator.Enemy != None)
					&& ((Instigator.Enemy == Instigator.Target) || (Instigator.Target == None))
					&& !Instigator.Enemy.IsA('StationaryPawn')
					&& (VSize(Instigator.Location - Instigator.Enemy.Location) > 700 + 1300 * FRand())
					&& (VSize(Instigator.Location - Instigator.Enemy.Location) < 2000) )
			{
				NewTarget = CheckTarget();
				OldTarget = NewTarget;
				if ( NewTarget == Instigator.Enemy )
				{
					if ( TimerCounter > 0.6 )
						SetTimer(1.0, true);
					Instigator.bFire = 0;
					bPendingLock = true;
					GotoState('Idle','PendingLock');
					return;
				}
			}
			bPendingLock = false;
			GotoState('NormalFire');
		}
		else
			GotoState('NormalFire');
	}
}

simulated function bool ClientFire( float Value )
{
	if ( bCanClientFire && ((Role == ROLE_Authority) || (AmmoType == None) || (AmmoType.AmmoAmount > 0)) )
	{
		GotoState('ClientFiring');
		return true;
	}
	return false;
}

simulated function FiringRockets()
{
	PlayRFiring(ClientRocketsLoaded - 1);
	bClientDone = true;
	Disable('Tick');
}

function AltFire( float Value )
{
	bPointing=True;
	bCanClientFire = true;
	if ( AmmoType == None )
	{
		// ammocheck
		GiveAmmo(Pawn(Owner));
	}
	if ( AmmoType.UseAmmo(1) )
		GoToState('AltFiring');
}

simulated function bool ClientAltFire( float Value )
{
	if ( bCanClientFire && ((Role == ROLE_Authority) || (AmmoType == None) || (AmmoType.AmmoAmount > 0)) )
	{
		GotoState('ClientAltFiring');
		return true;
	}
	return false;
}

function Actor CheckTarget()
{
	local Actor ETarget;
	local Vector Start, X,Y,Z;
	local float bestDist, bestAim;
	local Pawn PawnOwner;
	local rotator AimRot;
	local int diff;

	PawnOwner = Pawn(Owner);
	bPointing = false;
	if ( Owner.IsA('PlayerPawn') )
	{
		GetAxes(PawnOwner.ViewRotation,X,Y,Z);
		Start = Owner.Location + CalcDrawOffset() + FireOffset.X * X + FireOffset.Y * Y + FireOffset.Z * Z; 
		bestAim = 0.93;
		ETarget = PawnOwner.PickTarget(bestAim, bestDist, X, Start);
	}
	else if ( PawnOwner.Enemy == None )
		return None; 
	else if ( Owner.IsA('Bot') && Bot(Owner).bNovice )
		return None;
	else if ( VSize(PawnOwner.Enemy.Location - PawnOwner.Location) < 2000 )
	{
		Start = Owner.Location + CalcDrawOffset() + FireOffset.Z * vect(0,0,1); 
		AimRot = rotator(PawnOwner.Enemy.Location - Start);
		diff = abs((AimRot.Yaw & 65535) - (PawnOwner.Rotation.Yaw & 65535));
		if ( (diff > 7200) && (diff < 58335) )
			return None;
		// check if can hold lock
		if ( !bPendingLock ) //not already locked
		{
			AimRot = rotator(PawnOwner.Enemy.Location + (3 - PawnOwner.Skill) * 0.3 * PawnOwner.Enemy.Velocity - Start);
			diff = abs((AimRot.Yaw & 65535) - (PawnOwner.Rotation.Yaw & 65535));
			if ( (diff > 16000) && (diff < 49535) )
				return None;
		}
							 
		// check line of sight
		ETarget = Trace(X,Y, PawnOwner.Enemy.Location, Start, false);
		if ( ETarget != None )
			return None;

		return PawnOwner.Enemy;
	}
	bPointing = (ETarget != None);
	Return ETarget;
}

//////////////////////////////////////////////////////
state AltFiring
{
	function Tick( float DeltaTime )
	{
		if( (pawn(Owner).bAltFire==0) || (RocketsLoaded > 5) )  // If if Fire button down, load up another
 			GoToState('FireRockets');
	}

	
	function AnimEnd()
	{
		if ( bRotated )
		{
			bRotated = false;
			PlayLoading(1.1, RocketsLoaded);
		}
		else
		{
			if ( RocketsLoaded == 6 )
			{
				GotoState('FireRockets');
				return;
			}
			RocketsLoaded++;
			AmmoType.UseAmmo(1);		
			if ( (PlayerPawn(Owner) == None) && ((FRand() > 0.5) || (Pawn(Owner).Enemy == None)) )
				Pawn(Owner).bAltFire = 0;
			bPointing = true;
			Owner.MakeNoise(0.6 * Pawn(Owner).SoundDampening);		
			RotateRocket();
		}
	}

	function RotateRocket()
	{
		if (AmmoType.AmmoAmount<=0)
		{ 
			GotoState('FireRockets');
			return;
		}		
		PlayRotating(RocketsLoaded-1);
		bRotated = true;
	}

	function BeginState()
	{
		Super.BeginState();
		RocketsLoaded = 1;
		bFireLoad = False;
		RotateRocket();
	}

Begin:
	bLockedOn = False;
}

///////////////////////////////////////////////////////
state NormalFire
{
	function bool SplashJump()
	{
		return true;
	}

	function Tick( float DeltaTime )
	{
		if ( (PlayerPawn(Owner) == None) 
			&& ((Pawn(Owner).MoveTarget != Pawn(Owner).Target) 
				|| (LockedTarget != None)
				|| (Pawn(Owner).Enemy == None)
				|| ( Mover(Owner.Base) != None )
				|| ((Owner.Physics == PHYS_Falling) && (Owner.Velocity.Z < 5))
				|| (VSize(Owner.Location - Pawn(Owner).Target.Location) < 400)
				|| !Pawn(Owner).CheckFutureSight(0.15)) )
			Pawn(Owner).bFire = 0;

		if( pawn(Owner).bFire==0 || RocketsLoaded > 5)  // If Fire button down, load up another
 			GoToState('FireRockets');
	}
	
	function AnimEnd()
	{
		if ( bRotated )
		{
			bRotated = false;
			PlayLoading(1.1, RocketsLoaded);
		}
		else
		{
			if ( RocketsLoaded == 6 )
			{
				GotoState('FireRockets');
				return;
			}
			RocketsLoaded++;
			AmmoType.UseAmmo(1);
			if (pawn(Owner).bAltFire!=0) bTightWad=True;
			NewTarget = CheckTarget();
			if ( Pawn(NewTarget) != None )
				Pawn(NewTarget).WarnTarget(Pawn(Owner), ProjectileSpeed, vector(Pawn(Owner).ViewRotation));	
			if ( LockedTarget != None )
			{
				If ( NewTarget != LockedTarget ) 
				{
					LockedTarget = None;
					Owner.PlaySound(Misc2Sound, SLOT_None, Pawn(Owner).SoundDampening);
					bLockedOn=False;
				}
				else if (LockedTarget != None)
 					Owner.PlaySound(Misc1Sound, SLOT_None, Pawn(Owner).SoundDampening);
			}
			bPointing = true;
			Owner.MakeNoise(0.6 * Pawn(Owner).SoundDampening);		
			RotateRocket();
		}
	}

	function BeginState()
	{
		Super.BeginState();
		bFireLoad = True;
		RocketsLoaded = 1;
		RotateRocket();
	}

	function RotateRocket()
	{
		if ( PlayerPawn(Owner) == None )
		{
			if ( FRand() > 0.33 )
				Pawn(Owner).bFire = 0;
			if ( Pawn(Owner).bFire == 0 )
			{
	 			GoToState('FireRockets');
				return;
			}
		}
		if ( AmmoType.AmmoAmount <= 0 ) 
		{
			GotoState('FireRockets');
			return;
		}
		if ( AmmoType.AmmoAmount == 1 )
			Owner.PlaySound(Misc2Sound, SLOT_None, Pawn(Owner).SoundDampening); 
		PlayRotating(RocketsLoaded-1);
		bRotated = true;
	}
				
Begin:
	Sleep(0.0);
}

///////////////////////////////////////////////////////
state Idle
{
	function Timer()
	{
		NewTarget = CheckTarget();
		if ( NewTarget == OldTarget )
		{
			LockedTarget = NewTarget;
			If (LockedTarget != None) 
			{
				bLockedOn=True;			
				Owner.MakeNoise(Pawn(Owner).SoundDampening);
				Owner.PlaySound(Misc1Sound, SLOT_None,Pawn(Owner).SoundDampening);
				if ( (Pawn(LockedTarget) != None) && (FRand() < 0.7) )
					Pawn(LockedTarget).WarnTarget(Pawn(Owner), ProjectileSpeed, vector(Pawn(Owner).ViewRotation));	
				if ( bPendingLock )
				{
					OldTarget = NewTarget;
					Pawn(Owner).bFire = 0;
					bFireLoad = True;
					RocketsLoaded = 1;
					GotoState('FireRockets', 'Begin');
					return;
				}
			}
		}
		else if( (OldTarget != None) && (NewTarget == None) ) 
		{
			Owner.PlaySound(Misc2Sound, SLOT_None,Pawn(Owner).SoundDampening);
			bLockedOn = False;
		}
		else 
		{
			LockedTarget = None;
			bLockedOn = False;
		}
		OldTarget = NewTarget;
		bPendingLock = false;
	}

Begin:
	if (Pawn(Owner).bFire!=0) Fire(0.0);
	if (Pawn(Owner).bAltFire!=0) AltFire(0.0);	
	bPointing=False;
	if (AmmoType.AmmoAmount<=0) 
		Pawn(Owner).SwitchToBestWeapon();  //Goto Weapon that has Ammo
	PlayIdleAnim();
	OldTarget = CheckTarget();
	SetTimer(1.25,True);
	LockedTarget = None;
	bLockedOn = False;
PendingLock:
	if ( bPendingLock )
		bPointing = true;
	if ( TimerRate <= 0 )
		SetTimer(1.0, true);
}


state ClientReload
{
	simulated function bool ClientFire(float Value)
	{
		bForceFire = bForceFire || ( bCanClientFire && (Pawn(Owner) != None) && (AmmoType.AmmoAmount > 0) );
		return bForceFire;
	}

	simulated function bool ClientAltFire(float Value)
	{
		bForceAltFire = bForceAltFire || ( bCanClientFire && (Pawn(Owner) != None) && (AmmoType.AmmoAmount > 0) );
		return bForceAltFire;
	}

	simulated function AnimEnd()
	{
		if ( bCanClientFire && (PlayerPawn(Owner) != None) && (AmmoType.AmmoAmount > 0) )
		{
			if ( bForceFire || (Pawn(Owner).bFire != 0) )
			{
				Global.ClientFire(0);
				return;
			}
			else if ( bForceAltFire || (Pawn(Owner).bAltFire != 0) )
			{
				Global.ClientAltFire(0);
				return;
			}
		}			
		GotoState('');
		Global.AnimEnd();
	}

	simulated function EndState()
	{
		bForceFire = false;
		bForceAltFire = false;
	}

	simulated function BeginState()
	{
		bForceFire = false;
		bForceAltFire = false;
	}
}

state ClientFiring
{
	simulated function Tick(float DeltaTime)
	{
		if ( (Pawn(Owner).bFire == 0) || (Ammotype.AmmoAmount <= 0) )
			FiringRockets();
	}
	
	simulated function AnimEnd()
	{
		if ( !bCanClientFire || (Pawn(Owner) == None) )
			GotoState('');
		else if ( bClientDone )
		{
			PlayLoading(1.5,0);
			GotoState('ClientReload');
		}
		else if ( bRotated )
		{
			PlayLoading(1.1, ClientRocketsLoaded);
			bRotated = false;
			ClientRocketsLoaded++;
		}
		else
		{
			if ( bInstantRocket || (ClientRocketsLoaded == 6) )
			{
				FiringRockets();
				return;
			}
			Enable('Tick');
			PlayRotating(ClientRocketsLoaded - 1);
			bRotated = true;
		}
	}

	simulated function BeginState()
	{
		bFireLoad = true;
		if ( bInstantRocket )
		{
			ClientRocketsLoaded = 1;
			FiringRockets();
		}
		else
		{
			ClientRocketsLoaded = 1;
			PlayRotating(ClientRocketsLoaded - 1);
			bRotated = true;
		}
	}

	simulated function EndState()
	{
		ClientRocketsLoaded = 0;
		bClientDone = false;
		bRotated = false;
	}
}

state ClientAltFiring
{
	simulated function Tick(float DeltaTime)
	{
		if ( (Pawn(Owner).bAltFire == 0) || (Ammotype.AmmoAmount <= 0) )
			FiringRockets();
	}
	
	simulated function AnimEnd()
	{
		if ( !bCanClientFire || (Pawn(Owner) == None) )
			GotoState('');
		else if ( bClientDone )
		{
			PlayLoading(1.5,0);
			GotoState('ClientReload');
		}
		else if ( bRotated )
		{
			PlayLoading(1.1, ClientRocketsLoaded);
			bRotated = false;
			ClientRocketsLoaded++;
		}
		else
		{
			if ( ClientRocketsLoaded == 6 )
			{
				FiringRockets();
				return;
			}
			Enable('Tick');
			PlayRotating(ClientRocketsLoaded - 1);
			bRotated = true;
		}
	}

	simulated function BeginState()
	{
		bFireLoad = false;
		ClientRocketsLoaded = 1;
		PlayRotating(ClientRocketsLoaded - 1);
		bRotated = true;
	}

	simulated function EndState()
	{
		ClientRocketsLoaded = 0;
		bClientDone = false;
		bRotated = false;
	}
}

///////////////////////////////////////////////////////
state FireRockets
{
	function Fire(float F) {}
	function AltFire(float F) {}

	function ForceFire()
	{
		bForceFire = true;
	}

	function ForceAltFire()
	{
		bForceAltFire = true;
	}

	function bool SplashJump()
	{
		return false;
	}

	function BeginState()
	{
		local vector FireLocation, StartLoc, X,Y,Z;
		local rotator FireRot, RandRot;
		local BlueProj bsp;
		local GreenProj gsp;
		local RedProj rsp;
		local GreyProj grsp;
		local GoldProj gosp;
		local PurpleProj psp;
		local ColorSeekingRocket s;
		local Color_grenade g;
		local float Angle, RocketRad;
		local pawn BestTarget, PawnOwner;
		local PlayerPawn PlayerOwner;
		local int DupRockets;
		local bool bMultiRockets;
		local int i;
      
		PawnOwner = Pawn(Owner);
		if ( PawnOwner == None )
			return;
		PawnOwner.PlayRecoil(FiringSpeed);
		PlayerOwner = PlayerPawn(Owner);
		Angle = 0;
		DupRockets = RocketsLoaded - 1;
		if (DupRockets < 0) DupRockets = 0;
		if ( PlayerOwner == None )
			bTightWad = ( FRand() * 4 < PawnOwner.skill );

		GetAxes(PawnOwner.ViewRotation,X,Y,Z);
		StartLoc = Owner.Location + CalcDrawOffset() + FireOffset.X * X + FireOffset.Y * Y + FireOffset.Z * Z; 

		if ( bFireLoad ) 		
			AdjustedAim = PawnOwner.AdjustAim(ProjectileSpeed, StartLoc, AimError, True, bWarnTarget);
		else 
			AdjustedAim = PawnOwner.AdjustToss(AltProjectileSpeed, StartLoc, AimError, True, bAltWarnTarget);	
			
		if ( PlayerOwner != None )
			AdjustedAim = PawnOwner.ViewRotation;
		
		PlayRFiring(RocketsLoaded-1);		
		Owner.MakeNoise(PawnOwner.SoundDampening);
		if ( !bFireLoad )
		{
			LockedTarget = None;
			bLockedOn = false;
		}
		else if ( LockedTarget != None )
		{
			BestTarget = Pawn(CheckTarget());
			if ( (LockedTarget!=None) && (LockedTarget != BestTarget) ) 
			{
				LockedTarget = None;
				bLockedOn=False;
			}
		}
		else 
			BestTarget = None;
		bPendingLock = false;
		bPointing = true;
		FireRot = AdjustedAim;
		RocketRad = 4;
		if (bTightWad || !bFireLoad) RocketRad=7;
		bMultiRockets = ( RocketsLoaded > 1 );
		//log(bRedeemer);
		if ( bRedeemer ) i = rand(9);	
		if ( !bRedeemer ) i = rand(8);
		//log (i);	
		
		switch(i)
		{
			case 0:
		While ( RocketsLoaded > 0 )
		{
			if ( bMultiRockets )
				Firelocation = StartLoc - (Sin(Angle)*RocketRad - 7.5)*Y + (Cos(Angle)*RocketRad - 7)*Z - X * 4 * FRand();
			else
				FireLocation = StartLoc;
			if (bFireLoad)
			{
				if ( Angle > 0 )
				{
					if ( Angle < 3 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw - Angle * 600;
					else if ( Angle > 3.5 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw + (Angle - 3)  * 600;
					else
						FireRot.Yaw = AdjustedAim.Yaw;
				}
				if ( LockedTarget != None )
				{
					s = Spawn( class 'Rainbow.ColorSeekingRocket',, '', FireLocation,FireRot);
					s.Seeking = LockedTarget;
					s.NumExtraRockets = DupRockets;					
					if ( Angle > 0 )
						s.Velocity *= (0.9 + 0.2 * FRand());			
				}
				else 
				{
					bsp = Spawn( class'Rainbow.BlueProj',, '', FireLocation,FireRot);
					bsp.NumExtraRockets = DupRockets;
					if ( Angle > 0 )
						bsp.Velocity *= (0.9 + 0.2 * FRand());	
				}
			}
			else 
			{
				g = Spawn( class 'Rainbow.Color_Grenade',, '', FireLocation,AdjustedAim);
				g.NumExtraGrenades = DupRockets;
				if ( DupRockets > 0 )
				{
					RandRot.Pitch = FRand() * 1500 - 750;
					RandRot.Yaw = FRand() * 1500 - 750;
					RandRot.Roll = FRand() * 1500 - 750;
					g.Velocity = g.Velocity >> RandRot;
				}
			}

			Angle += 1.0484; //2*3.1415/6;
			RocketsLoaded--;
		}
		case 1:
		While ( RocketsLoaded > 0 )
		{
			if ( bMultiRockets )
				Firelocation = StartLoc - (Sin(Angle)*RocketRad - 7.5)*Y + (Cos(Angle)*RocketRad - 7)*Z - X * 4 * FRand();
			else
				FireLocation = StartLoc;
			if (bFireLoad)
			{
				if ( Angle > 0 )
				{
					if ( Angle < 3 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw - Angle * 600;
					else if ( Angle > 3.5 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw + (Angle - 3)  * 600;
					else
						FireRot.Yaw = AdjustedAim.Yaw;
				}
				if ( LockedTarget != None )
				{
					s = Spawn( class 'Rainbow.ColorSeekingRocket',, '', FireLocation,FireRot);
					s.Seeking = LockedTarget;
					s.NumExtraRockets = DupRockets;					
					if ( Angle > 0 )
						s.Velocity *= (0.9 + 0.2 * FRand());			
				}
				else 
				{
					gsp = Spawn( class'Rainbow.GreenProj',, '', FireLocation,FireRot);
					gsp.NumExtraRockets = DupRockets;
					if ( Angle > 0 )
						gsp.Velocity *= (0.9 + 0.2 * FRand());	
				}
			}
			else 
			{
				g = Spawn( class 'Rainbow.Color_Grenade',, '', FireLocation,AdjustedAim);
				g.NumExtraGrenades = DupRockets;
				if ( DupRockets > 0 )
				{
					RandRot.Pitch = FRand() * 1500 - 750;
					RandRot.Yaw = FRand() * 1500 - 750;
					RandRot.Roll = FRand() * 1500 - 750;
					g.Velocity = g.Velocity >> RandRot;
				}
			}

			Angle += 1.0484; //2*3.1415/6;
			RocketsLoaded--;
		}
		case 2:
		While ( RocketsLoaded > 0 )
		{
			if ( bMultiRockets )
				Firelocation = StartLoc - (Sin(Angle)*RocketRad - 7.5)*Y + (Cos(Angle)*RocketRad - 7)*Z - X * 4 * FRand();
			else
				FireLocation = StartLoc;
			if (bFireLoad)
			{
				if ( Angle > 0 )
				{
					if ( Angle < 3 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw - Angle * 600;
					else if ( Angle > 3.5 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw + (Angle - 3)  * 600;
					else
						FireRot.Yaw = AdjustedAim.Yaw;
				}
				if ( LockedTarget != None )
				{
					s = Spawn( class 'Rainbow.ColorSeekingRocket',, '', FireLocation,FireRot);
					s.Seeking = LockedTarget;
					s.NumExtraRockets = DupRockets;					
					if ( Angle > 0 )
						s.Velocity *= (0.9 + 0.2 * FRand());			
				}
				else 
				{
					gosp = Spawn( class'Rainbow.GoldProj',, '', FireLocation,FireRot);
					gosp.NumExtraRockets = DupRockets;
					if ( Angle > 0 )
						gosp.Velocity *= (0.9 + 0.2 * FRand());	
				}
			}
			else 
			{
				g = Spawn( class 'Rainbow.Color_Grenade',, '', FireLocation,AdjustedAim);
				g.NumExtraGrenades = DupRockets;
				if ( DupRockets > 0 )
				{
					RandRot.Pitch = FRand() * 1500 - 750;
					RandRot.Yaw = FRand() * 1500 - 750;
					RandRot.Roll = FRand() * 1500 - 750;
					g.Velocity = g.Velocity >> RandRot;
				}
			}

			Angle += 1.0484; //2*3.1415/6;
			RocketsLoaded--;
		}
		case 3:
		While ( RocketsLoaded > 0 )
		{
			if ( bMultiRockets )
				Firelocation = StartLoc - (Sin(Angle)*RocketRad - 7.5)*Y + (Cos(Angle)*RocketRad - 7)*Z - X * 4 * FRand();
			else
				FireLocation = StartLoc;
			if (bFireLoad)
			{
				if ( Angle > 0 )
				{
					if ( Angle < 3 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw - Angle * 600;
					else if ( Angle > 3.5 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw + (Angle - 3)  * 600;
					else
						FireRot.Yaw = AdjustedAim.Yaw;
				}
				if ( LockedTarget != None )
				{
					s = Spawn( class 'Rainbow.ColorSeekingRocket',, '', FireLocation,FireRot);
					s.Seeking = LockedTarget;
					s.NumExtraRockets = DupRockets;					
					if ( Angle > 0 )
						s.Velocity *= (0.9 + 0.2 * FRand());			
				}
				else 
				{
					grsp = Spawn( class'Rainbow.GreyProj',, '', FireLocation,FireRot);
					grsp.NumExtraRockets = DupRockets;
					if ( Angle > 0 )
						grsp.Velocity *= (0.9 + 0.2 * FRand());	
				}
			}
			else 
			{
				g = Spawn( class 'Rainbow.Color_Grenade',, '', FireLocation,AdjustedAim);
				g.NumExtraGrenades = DupRockets;
				if ( DupRockets > 0 )
				{
					RandRot.Pitch = FRand() * 1500 - 750;
					RandRot.Yaw = FRand() * 1500 - 750;
					RandRot.Roll = FRand() * 1500 - 750;
					g.Velocity = g.Velocity >> RandRot;
				}
			}

			Angle += 1.0484; //2*3.1415/6;
			RocketsLoaded--;
		}
		case 4:
		While ( RocketsLoaded > 0 )
		{
			if ( bMultiRockets )
				Firelocation = StartLoc - (Sin(Angle)*RocketRad - 7.5)*Y + (Cos(Angle)*RocketRad - 7)*Z - X * 4 * FRand();
			else
				FireLocation = StartLoc;
			if (bFireLoad)
			{
				if ( Angle > 0 )
				{
					if ( Angle < 3 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw - Angle * 600;
					else if ( Angle > 3.5 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw + (Angle - 3)  * 600;
					else
						FireRot.Yaw = AdjustedAim.Yaw;
				}
				if ( LockedTarget != None )
				{
					s = Spawn( class 'Rainbow.ColorSeekingRocket',, '', FireLocation,FireRot);
					s.Seeking = LockedTarget;
					s.NumExtraRockets = DupRockets;					
					if ( Angle > 0 )
						s.Velocity *= (0.9 + 0.2 * FRand());			
				}
				else 
				{
					psp = Spawn( class'Rainbow.PurpleProj',, '', FireLocation,FireRot);
					psp.NumExtraRockets = DupRockets;
					if ( Angle > 0 )
						psp.Velocity *= (0.9 + 0.2 * FRand());	
				}
			}
			else 
			{
				g = Spawn( class 'Rainbow.Color_Grenade',, '', FireLocation,AdjustedAim);
				g.NumExtraGrenades = DupRockets;
				if ( DupRockets > 0 )
				{
					RandRot.Pitch = FRand() * 1500 - 750;
					RandRot.Yaw = FRand() * 1500 - 750;
					RandRot.Roll = FRand() * 1500 - 750;
					g.Velocity = g.Velocity >> RandRot;
				}
			}

			Angle += 1.0484; //2*3.1415/6;
			RocketsLoaded--;
		}
		case 5:
		While ( RocketsLoaded > 0 )
		{
			if ( bMultiRockets )
				Firelocation = StartLoc - (Sin(Angle)*RocketRad - 7.5)*Y + (Cos(Angle)*RocketRad - 7)*Z - X * 4 * FRand();
			else
				FireLocation = StartLoc;
			if (bFireLoad)
			{
				if ( Angle > 0 )
				{
					if ( Angle < 3 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw - Angle * 600;
					else if ( Angle > 3.5 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw + (Angle - 3)  * 600;
					else
						FireRot.Yaw = AdjustedAim.Yaw;
				}
				if ( LockedTarget != None )
				{
					s = Spawn( class 'Rainbow.ColorSeekingRocket',, '', FireLocation,FireRot);
					s.Seeking = LockedTarget;
					s.NumExtraRockets = DupRockets;					
					if ( Angle > 0 )
						s.Velocity *= (0.9 + 0.2 * FRand());			
				}
				else 
				{
					gsp = Spawn( class'Rainbow.GreenProj',, '', FireLocation,FireRot);
					gsp.NumExtraRockets = DupRockets;
					if ( Angle > 0 )
						gsp.Velocity *= (0.9 + 0.2 * FRand());	
				}
			}
			else 
			{
				g = Spawn( class 'Rainbow.Color_Grenade',, '', FireLocation,AdjustedAim);
				g.NumExtraGrenades = DupRockets;
				if ( DupRockets > 0 )
				{
					RandRot.Pitch = FRand() * 1500 - 750;
					RandRot.Yaw = FRand() * 1500 - 750;
					RandRot.Roll = FRand() * 1500 - 750;
					g.Velocity = g.Velocity >> RandRot;
				}
			}

			Angle += 1.0484; //2*3.1415/6;
			RocketsLoaded--;
		}
		case 6:
		While ( RocketsLoaded > 0 )
		{
			if ( bMultiRockets )
				Firelocation = StartLoc - (Sin(Angle)*RocketRad - 7.5)*Y + (Cos(Angle)*RocketRad - 7)*Z - X * 4 * FRand();
			else
				FireLocation = StartLoc;
			if (bFireLoad)
			{
				if ( Angle > 0 )
				{
					if ( Angle < 3 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw - Angle * 600;
					else if ( Angle > 3.5 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw + (Angle - 3)  * 600;
					else
						FireRot.Yaw = AdjustedAim.Yaw;
				}
				if ( LockedTarget != None )
				{
					s = Spawn( class 'Rainbow.ColorSeekingRocket',, '', FireLocation,FireRot);
					s.Seeking = LockedTarget;
					s.NumExtraRockets = DupRockets;					
					if ( Angle > 0 )
						s.Velocity *= (0.9 + 0.2 * FRand());			
				}
				else 
				{
					gosp = Spawn( class'Rainbow.GoldProj',, '', FireLocation,FireRot);
					gosp.NumExtraRockets = DupRockets;
					if ( Angle > 0 )
						gosp.Velocity *= (0.9 + 0.2 * FRand());	
				}
			}
			else 
			{
				g = Spawn( class 'Rainbow.Color_Grenade',, '', FireLocation,AdjustedAim);
				g.NumExtraGrenades = DupRockets;
				if ( DupRockets > 0 )
				{
					RandRot.Pitch = FRand() * 1500 - 750;
					RandRot.Yaw = FRand() * 1500 - 750;
					RandRot.Roll = FRand() * 1500 - 750;
					g.Velocity = g.Velocity >> RandRot;
				}
			}

			Angle += 1.0484; //2*3.1415/6;
			RocketsLoaded--;
		}
		case 7:
		While ( RocketsLoaded > 0 )
		{
			if ( bMultiRockets )
				Firelocation = StartLoc - (Sin(Angle)*RocketRad - 7.5)*Y + (Cos(Angle)*RocketRad - 7)*Z - X * 4 * FRand();
			else
				FireLocation = StartLoc;
			if (bFireLoad)
			{
				if ( Angle > 0 )
				{
					if ( Angle < 3 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw - Angle * 600;
					else if ( Angle > 3.5 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw + (Angle - 3)  * 600;
					else
						FireRot.Yaw = AdjustedAim.Yaw;
				}
				if ( LockedTarget != None )
				{
					s = Spawn( class 'Rainbow.ColorSeekingRocket',, '', FireLocation,FireRot);
					s.Seeking = LockedTarget;
					s.NumExtraRockets = DupRockets;					
					if ( Angle > 0 )
						s.Velocity *= (0.9 + 0.2 * FRand());			
				}
				else 
				{
					grsp = Spawn( class'Rainbow.GreyProj',, '', FireLocation,FireRot);
					grsp.NumExtraRockets = DupRockets;
					if ( Angle > 0 )
						grsp.Velocity *= (0.9 + 0.2 * FRand());	
				}
			}
			else 
			{
				g = Spawn( class 'Rainbow.Color_Grenade',, '', FireLocation,AdjustedAim);
				g.NumExtraGrenades = DupRockets;
				if ( DupRockets > 0 )
				{
					RandRot.Pitch = FRand() * 1500 - 750;
					RandRot.Yaw = FRand() * 1500 - 750;
					RandRot.Roll = FRand() * 1500 - 750;
					g.Velocity = g.Velocity >> RandRot;
				}
			}

			Angle += 1.0484; //2*3.1415/6;
			RocketsLoaded--;
		}
		case 8:
		While ( RocketsLoaded > 0 )
		{
			if ( bMultiRockets )
				Firelocation = StartLoc - (Sin(Angle)*RocketRad - 7.5)*Y + (Cos(Angle)*RocketRad - 7)*Z - X * 4 * FRand();
			else
				FireLocation = StartLoc;
			if (bFireLoad)
			{
				if ( Angle > 0 )
				{
					if ( Angle < 3 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw - Angle * 600;
					else if ( Angle > 3.5 && !bTightWad)
						FireRot.Yaw = AdjustedAim.Yaw + (Angle - 3)  * 600;
					else
						FireRot.Yaw = AdjustedAim.Yaw;
				}
				if ( LockedTarget != None )
				{
					s = Spawn( class 'Rainbow.ColorSeekingRocket',, '', FireLocation,FireRot);
					s.Seeking = LockedTarget;
					s.NumExtraRockets = DupRockets;					
					if ( Angle > 0 )
						s.Velocity *= (0.9 + 0.2 * FRand());			
				}
				else 
				{
					rsp = Spawn( class'Rainbow.RedProj',, '', FireLocation,FireRot);
					rsp.NumExtraRockets = DupRockets;
					if ( Angle > 0 )
						rsp.Velocity *= (0.9 + 0.2 * FRand());	
				}
			}
			else 
			{
				g = Spawn( class 'Rainbow.Color_Grenade',, '', FireLocation,AdjustedAim);
				g.NumExtraGrenades = DupRockets;
				if ( DupRockets > 0 )
				{
					RandRot.Pitch = FRand() * 1500 - 750;
					RandRot.Yaw = FRand() * 1500 - 750;
					RandRot.Roll = FRand() * 1500 - 750;
					g.Velocity = g.Velocity >> RandRot;
				}
			}

			Angle += 1.0484; //2*3.1415/6;
			RocketsLoaded--;
		}
		break;
		}
		bTightWad=False;
		bRotated = false;
	}

	function AnimEnd()
	{
		if ( !bRotated && (AmmoType.AmmoAmount > 0) ) 
		{	
			PlayLoading(1.5,0);
			RocketsLoaded = 1;
			bRotated = true;
			return;
		}
		LockedTarget = None;
		Finish();
	}
Begin:	
}

defaultproperties
{
     LoadAnim(0)=load1
     LoadAnim(1)=Load2
     LoadAnim(2)=Load3
     LoadAnim(3)=Load4
     LoadAnim(4)=Load5
     LoadAnim(5)=Load6
     RotateAnim(0)=Rotate1
     RotateAnim(1)=Rotate2
     RotateAnim(2)=Rotate3
     RotateAnim(3)=Rotate4
     RotateAnim(4)=Rotate5
     RotateAnim(5)=Rotate3
     FireAnim(0)=Fire1
     FireAnim(1)=Fire2
     FireAnim(2)=Fire3
     FireAnim(3)=Fire4
     FireAnim(4)=Fire2
     FireAnim(5)=Fire3
     WeaponDescription="Classification: Heavy Ballistic"
     AmmoName=Class'Rainbow.ColorRocketPack'
     PickupAmmoCount=24
     bWarnTarget=True
     bAltWarnTarget=True
     bSplashDamage=True
     bRecommendSplashDamage=True
     bRedeemer=True	
     FiringSpeed=1.000000
     FireOffset=(X=10.000000,Y=-5.000000,Z=-8.800000)
     AltProjectileClass=Class'Rainbow.Color_Grenade'
     shakemag=350.000000
     shaketime=0.200000
     shakevert=7.500000
     AIRating=0.750000
     RefireRate=0.250000
     AltRefireRate=0.250000
     AltFireSound=Sound'UnrealShare.Eightball.EightAltFire'
     CockingSound=Sound'UnrealShare.Eightball.Loading'
     SelectSound=Sound'UnrealShare.Eightball.Selecting'
     Misc1Sound=Sound'UnrealShare.Eightball.SeekLock'
     Misc2Sound=Sound'UnrealShare.Eightball.SeekLost'
     Misc3Sound=Sound'UnrealShare.Eightball.BarrelMove'
     DeathMessage="%o was bitch slapped by %k's %w."
     NameColor=(G=0,B=0)
     InventoryGroup=9
     PickupMessage="You got the Color Eightball Launcher."
     ItemName="Color Eightball Launcher"
     PlayerViewOffset=(X=2.400000,Y=-1.000000,Z=-2.200000)
     PlayerViewMesh=LodMesh'Rainbow.C_Eightm'
     PlayerViewScale=2.000000
     BobDamping=0.975000
     PickupViewMesh=LodMesh'Rainbow.C_Eight2Pick'
     ThirdPersonMesh=LodMesh'Rainbow.C_EightHand'
     StatusIcon=Texture'Botpack.Icons.Use8ball'
     PickupSound=Sound'UnrealShare.Pickups.WeaponPickup'
     Icon=Texture'Botpack.Icons.Use8ball'
     Mesh=LodMesh'Rainbow.C_Eight2Pick'
     bNoSmooth=False
     CollisionHeight=10.000000
}
