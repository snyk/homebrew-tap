class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1226.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1226.0/snyk-macos"
    sha256 "f43a60101b03dc0fbc5381dc2b6872d8de8ab61c134d91c5e0cff13b975d64e4"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1226.0/snyk-linux"
    sha256 "80a417d6a1d7946841ea3c87d195e28dc7ad3c6cf84160c271eb7118a17dbb28"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
