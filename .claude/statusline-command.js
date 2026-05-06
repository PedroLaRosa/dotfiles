#!/usr/bin/env node

const { execSync } = require("child_process");

let input = "";
process.stdin.on("data", (chunk) => (input += chunk));
process.stdin.on("end", () => {
  const data = JSON.parse(input);
  const model = data.model.display_name;
  const cost = data.cost?.total_cost_usd || 0;
  const pct = Math.floor(data.context_window?.used_percentage || 0);
  const durationMs = data.cost?.total_duration_ms || 0;
  const usage = data.context_window?.current_usage || {};
  const tokens =
    (usage.input_tokens || 0) +
    (usage.output_tokens || 0) +
    (usage.cache_creation_input_tokens || 0) +
    (usage.cache_read_input_tokens || 0);
  const tokenStr =
    tokens >= 1000 ? `${(tokens / 1000).toFixed(1)}k` : `${tokens}`;

  const CYAN = "\x1b[36m",
    GREEN = "\x1b[32m",
    YELLOW = "\x1b[33m",
    RED = "\x1b[31m",
    RESET = "\x1b[0m";

  const barColor = pct >= 90 ? RED : pct >= 70 ? YELLOW : GREEN;
  const filled = Math.floor(pct / 10);
  const bar = "█".repeat(filled) + "░".repeat(10 - filled);

  const mins = Math.floor(durationMs / 60000);
  const secs = Math.floor((durationMs % 60000) / 1000);

  let branch = "";
  try {
    branch = execSync("git branch --show-current", {
      encoding: "utf8",
      stdio: ["pipe", "pipe", "ignore"],
    }).trim();
    branch = branch ? ` | 🌿 ${branch}` : "";
  } catch {}

  console.log(
    `${CYAN}[${model}]${RESET} ${barColor}${bar}${RESET} ${pct}% (${tokenStr}) ${branch}`,
  );
  console.log(
    cost > 0
      ? `${YELLOW}$${cost.toFixed(2)}${RESET} | ⏱️ ${mins}m ${secs}s`
      : "",
  );
});
