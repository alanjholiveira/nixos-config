{ config, ... }:

{
  config = {
    time.timeZone = "America/Sao_Paulo";
    # Windows wants hardware clock in local time instead of UTC
    time.hardwareClockInLocalTime = true;
    # services.timesyncd.enable = true;
  };
}
