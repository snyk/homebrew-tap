class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.630.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.630.0/snyk-macos"
    sha256 "b348f1614f4cdeae08bab9c80e8fd4251de3353c9ecf255a762bb5839ebeffa3"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.630.0/snyk-linux"
    sha256 "b05ba7057f6d1bff7ceb7f1b78fa04d53c9c4cbc7d7c680653cc7d8dcd0dba75"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
