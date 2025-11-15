---
description: "Solo Workflow Golden Rules - Critical Success Guide for AI Assistant Usage"
globs: []
alwaysApply: true
---

<!-- USE AT YOUR OWN RISK: This template has been tested extensively but may not work in all environments. Always backup your work and test in non-production environments first. -->

# Solo Workflow Golden Rules

**Essential guide for successful AI assistant collaboration with the "top" confirmation workflow.**

⸻

## **CRITICAL: START EVERY NEW CHAT WITH THIS!**

### **Step 1: AI Assistant Rule Activation**
**At the beginning of EVERY new chat session, tell your AI assistant:**

```
"Please read and follow all rules in .ai-ide/rules (for example .cursor/rules). 
Pay special attention to the 'top' confirmation workflow. 
I will say 'top' when I want you to commit the logical changes we just made."
```

### **Step 2: Verify Understanding**
The AI should respond with something like:
```
"RULE VALIDATION: I now automatically follow all rules!
I will wait for your 'top' confirmation before committing any changes."
```

⸻

## **The "TOP" Workflow - How It Works**

### **What "top" means:**
- **I tested the changes and they work**
- **I'm satisfied with this logical group of changes**  
- **Please commit these changes now**
- **Move to the next logical change (if any)**

### **Example Session:**
```
You: "Make the button smaller and change the text color to blue"

AI: [Makes changes to button size]
AI: [Makes changes to text color]  
AI: "Changes complete. Please test and say 'top' when ready to commit."

You: [Tests in simulator/browser]
You: "top"

AI: [Commits first logical change: button size]
AI: [Commits second logical change: text color] 
AI: "Both logical changes committed separately!"
```

⸻

## **Common Mistakes to Avoid**

### **Don't do this:**
- Starting chat without mentioning the rules
- Saying "commit" instead of "top"  
- Not testing changes before saying "top"

### **Do this instead:**
- Always start with rule explanation
- Always use "top" for confirmation
- Always test changes first
- Keep logical groups manageable (max 3 changes for a commit)

⸻

## **Best Practices for Maximum Success**

### **1. Keep logical groups manageable:**
```
Good: "Make button smaller, change color, fix icon alignment" → test → "top"
Better: "top - and also make the navbar responsive and add dark mode toggle" → continue working
Bad: Working on 10+ changes without any commits
Optimal: Writing only ‘top’ will cost you an entire prompt, so it’s much more efficient to confirm the change with ‘top’ and give the AI an additional task at the same time. This keeps your workflow optimal. See Step 3 for more information.
```

### **2. Test everything before "top":**
- Run your app/website
- Check that changes work as expected
- Only then say "top" + new task

### **3. Use "top" efficiently:**
- **Combine with next instruction**: "top - and also add dark mode toggle"
- **Save tokens**: Don't send "top" alone, add your next request
- **Keep momentum**: "top - now let's optimize the database queries"

### **4. If something breaks:**
```
You: "Wait, that broke something. Don't commit yet."
AI: "Understood, fixing the issue first."
[AI fixes the problem]
You: [Tests again] "Now it works. top"
```

⸻

## **Troubleshooting**

### **Problem: AI commits without "top"**
**Solution:** Remind the AI:
```
"Please wait for my 'top' confirmation before committing. 
Read the rules again and follow the 'top' workflow."
```

### **Problem: AI asks for clarification on rules**
**Solution:** Be specific:
```
"Follow the solo-workflow.md rules. Wait for 'top' before committing.
One logical change = one commit."
This should never happen, but the longer your chat becomes, the more likely it is that the AI will get confused. The observed rate of this occurring is about 0.1% to 1.0%.
```

### **Problem: Too many uncommitted changes**
**Solution:** Commit current work and continue:
```
"top - we have a lot of changes now, let's commit and continue with the API integration"
[AI commits current logical groups, then continues with API work]
```

⸻

## Quick Reference Checklist

**At start of every chat:**
- [ ] Tell AI to read and follow rules
- [ ] Mention the "top" workflow specifically
- [ ] Verify AI understands

**During development:**
- [ ] Work on multiple related changes
- [ ] Test changes thoroughly
- [ ] Use "top" + next instruction to save tokens
- [ ] Commit when you have 3-5 logical groups or feel it's getting complex

**Before saying "top":**
- [ ] All changes work as expected
- [ ] No broken functionality
- [ ] Ready for this logical group to be committed

⸻

## **Success Indicators**

**You know it's working when:**
- AI waits for "top" before committing
- Each logical change gets its own commit
- Version numbers increment correctly
- Git history is clean and logical
- You never have broken commits

**This workflow has been tested over hundreds of hours and works reliably when followed correctly!**
