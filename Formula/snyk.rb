class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.486.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.486.0/snyk-macos"
    sha256 "eacefbc3a816cc1c37beac8778b322769c475327e15461d068a5cfc8828a91ed"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.486.0/snyk-linux"
    sha256 "dde9d4339769e94fdf42c8b063f74c0be91190e8258e8ced64770d4dcfcb532e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
