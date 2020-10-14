class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.413.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.413.3/snyk-macos"
    sha256 "5d0836bb11e0a0e7307b9bb59aa77c12e0f03a667916e9eb20bef128377a8f29"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.413.3/snyk-linux"
    sha256 "d4f7bf7588798a407f486959a6380fc89345dac56e79e8385d57dd33df405cf3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
