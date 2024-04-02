{ config, ... }:

{
  services.timesyncd.enable = true;
  config = {

    time.timeZone = "America/Sao_Paulo";
    # Windows wants hardware clock in local time instead of UTC
    time.hardwareClockInLocalTime = true;
  }
}
