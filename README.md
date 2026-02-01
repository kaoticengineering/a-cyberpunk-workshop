# A Cyberpunk Workshop

A cyberpunk-themed incremental management game where you play as a Shadowy Overlord who never leaves their workshop. Deploy disposable Agents into a dangerous, not-so-distant, futuristic world. Observe the Agents' fights and loot acquisition from the safety of your growing workshop/lair. Then use the resources the Agents found for you to upgrade your workshop, perform research, and for loyal Agents, upgrade their Cyberware and Genetics.

## Core Concept

You are the unseen handler, scientist, engineer, an orchestrator who sends expendable agents into the world. Each agent is mostly autonomous once deployed; their survival is not at all guaranteed. You're goal is to build up your workshop capabilities, equip your agents, perform resource and risk-management, grow your power and reputation without ever walking outside.

## Game Loop

```
Workshop Management 
    ↓
Deploy Agent(s) (Set return conditions)
    ↓
Watch/Wait (Observe; Override options: Stay Out, Immediately Return)
    ↓
Agent Returns with Loot OR Dies While Out
    ↓
Use Loot to Upgrade Workshop/Agent; Build Equip/Cyberware/Gene Therapies; Perform Research; Hire Agent(s)
    ↓
Deploy Agent(s) (now better equipped)
```

## Core Mechanics

### The World
- **2D grid-based map** with your workshop at origin (0,0)
- **Distance-based difficulty**: Danger and rewards increase the further agents venture from the workshop
- **Persistent loot**: Dead agents drop all their gear at their death location
- **Loot decay**: Dropped items decrease in quantity over time and equipment eventually vanishes
- **Block-based movement**: Agents traverse the world one block at a time

### Agents

**Organic Stat Progression** - No XP or skill points. Stats grow based on what agents actually do:
- **Strength**: Increases through melee combat
- **Defense**: Increases from taking damage and surviving
- **Perception**: Increases from finding hidden loot  
- **Agility**: Increases from cumulative distance traveled
- **HP**: Core survival stat

**Equipment & Augmentation:**
- Weapons (melee-focused initially)
- Armor/Clothing
- Cyberware implants
- Genetic modifications

**Death is Permanent:**
- When an agent dies, all equipped gear drops at that location
- Future agents can recover dropped loot if they reach that block
- Hiring a new agent costs a min based on agent stats, up to a max of 100% player currency (stat penalty if this happens)
- Seasoned agents become genuinely valuable investments and don't feel nearly as expendable

### Deployment System

**Pre-Deployment Configuration:**
Set automatic return conditions using boolean logic:
- Time > X minutes
- HP < Y%  
- Loot Capacity >= Z%

**Manual Controls During Mission:**
- **Override Button**: Hold to keep agent out despite return conditions being met
- **Return ASAP Button**: Immediately recall agent

**Movement Modes:**
- **Adventure Mode**: Normal exploration speed
- **Fast**: Perception is reduced, speed is doubled
- **Slow**: Percetion is double, speed is halved
- **Return Mode**: Half the time, takes most direct path to (0,0)

### Combat System (v1)
- **Turn-based** encounters
- **Attacks never miss**
- **Initiative**: Whoever has higher Agility attacks first
- **Enemy stats**: Scale based on distance from (0,0)
- **Victory condition**: Opponent's HP ≤ 0
- **Loot**: Awarded based on distance from (0,0)

### Resources

**Three Core Types:**
- **Currency**: Used for hiring agents and various purchases
- **Raw Material**: Used for forging weapons, armor, cyberware, and some workshop upgrades
- **Bio Material**: Used for genetic research and therapies

### Workshop Capabilities

**Forge Equipment:**
- Create weapons and armor
- View current inventory
- Upgrade, disassemble, or sell existing items

**Fabricate Cyberware:**
- Create cybernetic implants
- View current inventory  
- Upgrade, disassemble, or sell existing cyberware

**Research Genetics:**
- Research new genetic therapies
- Prepare therapies for application to agents
- View current inventory
- Sell existing therapies

### Progression Systems

**Reputation:**
- Unlocks additional **Agent Slots**
- Allows deploying multiple agents simultaneously (late-game feature)

**Agent Hiring:**
- Base cost: 100% of current currency
- Future iterations will include:
  - Cost scaling: `min(X, player.getMoney())`
  - Stat variation based on payment amount
  - Choice between multiple agent candidates
  - Agent personality traits and affinities
  - Starting equipment variations

## User Interface Layout

### Main Layout Structure
```
┌─────────┬──────────┬────────────────────────────────────────────────────────────────────┐
│  Tabs   │   Info   │                                                                    │
│         │   Bar    │                          Content Area                              │
│Workshop │          │                                                                    │
│ Agents  │Currency  │                      (Active Tab Content)                          │
│Deploymnt│Resources │                                                                    │
│  Redo   │Agents    │                                                                    │
│Settings │Rep       │                                                                    │
│         │Deployed  │                                                                    │
│         │          │                                                                    │
│         │          │                                                                    │
│         │          │                                                                    │
│         │          │                                                                    │
│         │          │                                                                    │
│         │          │                                                                    │
│         │          │                                                                    │
│         │          │                                                                    │
│         │          │                                                                    │
│         │          │                                                                    │
│         │          │                                                                    │
└─────────┴──────────┴────────────────────────────────────────────────────────────────────┘
```

### Always-Visible Info Bar
- Currency
- Raw Material
- Bio Material  
- Active Agents (X/Y slots)
- Reputation
- **Per Deployed Agent**: HP, Encumbrance %, Distance from workshop

### Workshop Tab
- **Forge Equipment**: Create and manage weapons/armor
- **Fabricate Cyberware**: Create and manage implants
- **Research Genetics**: Unlock and prepare genetic therapies

### Agents Tab
- View all hired agents and available slots
- Inspect agent stats and equipped gear
- Hire new agents
- Equip/unequip gear
- Install cyberware
- Apply genetic therapies

### Deployment Tab
- Select agent for deployment
- Configure automatic return rules
- Deploy button
- Live mission feed (scrolling text of events)
- Manual override controls

### Settings Tab
- Manual save/load
- Import/export save data (JSON)
- Game settings

## Target Player Experience

### First Play Session (Day 1)
Players should experience:
- **5-10 agent deployments**
- **At least 1 agent death** is expected
- **3-5 workshop upgrades**
- **2-3 minute early missions**

### Core Vibes
- **Risk/Reward**: "Should I hit Return Now or Push?"
- **Investment**: A seasoned agent's stats and gear makes their potential death genuinely scary and potentially rage inducing
- **Recovery Dilemmas**: Do you send a fresh agent to recover that expensive cyberware from your last agent's corpse or risk it vanishing?
- **Satisfaction**: Seeing your workshop capabilities and agent quality improve over time

## Development Roadmap

### MVP (Iteration 1) - Text-Based
- [ ] Core UI shell (tabs, stats bar, content areas)
- [ ] Text-based mission output
- [ ] Basic agent stats system
- [ ] Simple turn-based combat
- [ ] Rule-based return system with manual overrides
- [ ] Workshop crafting (basic versions)
- [ ] Three resource types (Currency, Raw, Bio)
- [ ] Agent hiring and permadeath
- [ ] Save/load system with import/export

### Iteration 2 - Visual Enhancement
- [ ] 2D map visualization
- [ ] Sprite-based agent representation
- [ ] Animated combat and loot collection
- [ ] Visual feedback for stat gains
- [ ] Particle effects for deaths/returns
- [ ] Workshop visuals

### Future Iterations
- [ ] Complex map zones (not just distance-based difficulty)
- [ ] Multiple enemy types with unique behaviors
- [ ] Expanded equipment and cyberware trees
- [ ] Genetic modification system depth
- [ ] Agent personality and affinity systems
- [ ] Resource variety and rarity tiers
- [ ] Prestige/Rebirth mechanics
- [ ] Multiplayer features (leaderboards (reputation), in-game chat?)
- [ ] Mini-games / other flavor enhancing features yet to be determined

## Technical Stack

- **Engine**: Godot 4.x
- **Language**: GDScript
- **Save Format**: JSON

### Project Architecture

**Scene Tree:**
- Main scene with TabBar, StatsBar, and ContentArea
- Packed scenes for each tab
- Reusable DeployedAgentStatus widget

**Autoloads:**
- `GameState.gd`: Central state management (resources, agents, reputation)
- `SaveSystem.gd`: JSON-based saving with autosave on events + exit

**Autosave Triggers:**
- Agent returns from deployment or dies
- Every 10 minutes

## Design Philosophy

**"Keep It Simple, Stupid"**
- Start with minimal viable features
- Text versions before graphics
- JSON for save data

**Player Agency vs. Automation**
- Hands-off agent behavior creates tension without micromanagement
- Strategic decisions happen in the workshop and deployment configuration
- The overrides to keep pushing or return asap are the sole in-the-moment decision making

**Meaningful Failure**
- Agent death is a setback, not a game over
- Scaling hire costs ensure consequences without bricking a save file
- Dropped loot creates risk/reward recovery scenarios

## Contributing

This is a personal learning project to get back into Godot and game development.

## License

MIT license

---

*"If they return empty handed, I'll find another use for them.."*
