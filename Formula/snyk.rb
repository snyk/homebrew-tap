class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.969.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.969.0/snyk-macos"
    sha256 "a659aabcb33827d4eec88f6b86cc140e21d9783e1475f9c97ff2d4fc3f46ddd1"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.969.0/snyk-linux"
    sha256 "39542d255a651340fc5ddcb0211b024c774bc411a24cb3fd5c3d02243a02fc8f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
