class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.716.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.716.0/snyk-macos"
    sha256 "85e70bb3019f6953181be2585db8eadd7c6a3a7bc451ed8b68bdf4a452522251"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.716.0/snyk-linux"
    sha256 "bb4be52f01b29cddc0e93b93faeb5fcd0802175f46fe48333bb17aa45c73a3b8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
