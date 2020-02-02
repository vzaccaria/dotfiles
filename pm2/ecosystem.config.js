module.exports = {
  apps: [
    {
      name: "serverino",
      script: "/usr/local/bin/serverino"
    },
    {
      name: "gotty",
      script: "tmux",
      args: "new -d gotty top"
    }
  ]
};
