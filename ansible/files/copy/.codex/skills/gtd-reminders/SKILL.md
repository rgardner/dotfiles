---
name: gtd-reminders
description: Manage GTD (Getting Things Done) workflow using macOS Reminders CLI. Handles 7 context lists Inbox (capture), Anytime (location-flexible), Work Computer (active computer work), Read/Review Work Computer (passive consumption), To Message Work (work communications), Office (physical office), and Tickler (time-specific). Guides daily Inbox processing, clarifies vague tasks into concrete next actions, suggests appropriate context lists, and follows GTD principles capture everything, process to zero daily, one next action per project.
---

# Getting Things Done Reminders

## List Structure

### Active Lists
- **Inbox**: Capture point for all incoming tasks, ideas, and commitments. Process to zero daily.
- **Anytime**: Next actions that can be done anywhere with no special requirements (calls, thinking, planning)
- **Work Computer**: Computer-based work actions excluding reading/reviewing (coding, writing, creating)
- **Read/Review Work Computer**: Reading, reviewing, or watching tasks that require the work computer
- **To Message Work**: Messages to send during working hours (emails, Slack, Teams)
- **Office**: Actions requiring physical presence at the office
- **Tickler**: Time-specific reminders and follow-ups

### Reference Lists (if they exist)
- **Projects**: Multi-step outcomes requiring more than one action
- **Waiting For**: Items delegated or awaiting response from others
- **Someday/Maybe**: Future possibilities not currently actionable

## Core GTD Workflow

### 1. Capture
- Add everything to Inbox immediately
- No processing during capture—just get it out of your head
- Use `reminders add "Inbox" "task description"` or similar CLI command

### 2. Clarify (Daily Inbox Processing)
For each Inbox item, ask:
- **Is it actionable?**
  - No → Delete, file as reference, or move to Someday/Maybe
  - Yes → Continue to next question
- **What's the next physical action?**
  - Rewrite vague items as concrete actions starting with verbs
- **Will it take less than 2 minutes?**
  - Yes → Do it now
  - No → Continue to Organize

### 3. Organize
Move clarified actions to the appropriate context list:
- **Anytime**: No equipment needed, location-flexible (phone calls, errands, thinking)
- **Work Computer**: Requires work computer, active work (writing code, creating documents)
- **Read/Review Work Computer**: Requires work computer, passive consumption (reading docs, reviewing PRs, watching videos)
- **To Message Work**: Communication during work hours
- **Office**: Must be physically in office (mail something, use office equipment)
- **Tickler**: Has a specific date/time → set due date and reminder

For multi-step outcomes:
- Create or update entry in Projects list
- Add immediate next action to appropriate context list

### 4. Review
- **Daily**: Process Inbox to zero
- **Weekly**: Review all lists, update Projects, move Someday/Maybe items if ready

### 5. Engage
Choose actions based on:
1. Context (where you are / what tools you have)
2. Time available
3. Energy level
4. Priority

## CLI Command Patterns

### Viewing Tasks
```bash
# View specific list
reminders show "Inbox"
reminders show "Anytime"
reminders show "Work Computer"

# View all incomplete tasks
reminders show --all

# View by due date
reminders show --due-today
reminders show --due-tomorrow
```

### Adding Tasks
```bash
# Add to Inbox (default capture)
reminders add "Inbox" "Review quarterly report"

# Add with due date
reminders add "Tickler" "Follow up with Sarah" --due "2024-01-15"

# Add with notes
reminders add "Work Computer" "Fix bug in auth flow" --notes "Issue #234"
```

### Moving Tasks (Processing Inbox)
```bash
# Move from Inbox to context list
reminders complete "Inbox" "task name"
reminders add "Work Computer" "task name"

# Or use move if available
reminders move "Inbox" "task name" "Work Computer"
```

### Completing Tasks
```bash
reminders complete "Anytime" "Call dentist"
```

## Processing Guidelines

### When Processing Inbox Items

**If it's a vague commitment:**
- "Look into X" → "Research X options and write summary" → Work Computer
- "Deal with Y" → "Email John about Y decision" → To Message Work

**If it's information:**
- Quick reference → Add to notes of relevant project/action
- Long-term reference → Delete from Reminders, file elsewhere

**If it's a project (multi-step):**
1. Add to Projects list with outcome defined
2. Identify very next physical action
3. Add next action to appropriate context list

**If it's waiting on someone:**
1. Move to Waiting For (if that list exists)
2. Or: Add to Tickler with follow-up date

### Context List Selection Logic

- Can I do this anywhere with just my phone? → **Anytime**
- Do I need to be at my computer creating/doing something? → **Work Computer**
- Is it reading, watching, or reviewing at computer? → **Read/Review Work Computer**
- Is it a message to send during work hours? → **To Message Work**
- Must I be physically in the office? → **Office**
- Does it have a specific time/date? → **Tickler** (with due date)

## Best Practices

1. **Capture immediately** - Never keep things in your head
2. **Process daily** - Inbox to zero every day
3. **One next action per project** - Only the immediate next step goes in context lists
4. **Verb-first actions** - "Call Sarah", "Draft proposal", "Review document"
5. **Concrete and specific** - "Email Tim project timeline" not "Tim stuff"
6. **Review weekly** - Ensure all projects have next actions
7. **Time-specific vs. context-specific** - Only truly time-bound items go in Tickler

## When Helping Users

- If user captures something vague, help them clarify the next physical action
- Suggest appropriate context list based on what the action requires
- If item seems like a project, help break down into next action
- Remind about 2-minute rule during processing
- Keep actions concrete and verb-driven
- Default to Inbox for quick captures unless context is obvious

## Example Workflows

### Processing Inbox Item
```
User: "Review the dashboard redesign"
Claude: This sounds like it might take >2 minutes. What's the specific next action?
- Review Figma mockups? → Read/Review Work Computer
- Provide feedback in document? → Work Computer
- Schedule review meeting? → To Message Work

User: Review the Figma mockups
Claude: Moving to "Read/Review Work Computer": "Review dashboard redesign Figma mockups"
```

### Breaking Down a Project
```
User: "Launch new feature"
Claude: This is a project with multiple steps. What's the very next action needed?
User: I need to write the announcement email
Claude: Great! Adding to "Work Computer": "Draft announcement email for new feature"
Would you like to add "Launch new feature" to your Projects list to track the overall outcome?
```
