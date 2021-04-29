class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.571.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.571.0/snyk-macos"
    sha256 "283ca0df4974a33a8247c5e9637a591dae3a959b440710c2cfa879e5cd82fbf9"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.571.0/snyk-linux"
    sha256 "a204e8257f6fdbf054ce1af9addbd34997f3086f191b384a423100d78b32c70e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
