class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.998.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.998.0/snyk-macos"
    sha256 "7dc41b015aa2fe5ab4868c4ad63a0718bb4478f75ad5bf8494161ab97e4f72f8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.998.0/snyk-linux"
    sha256 "384799eac1ed2526612363cafd17a6a61c1a2167290df577499fb7a07cd1cfea"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
