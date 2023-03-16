class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1119.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1119.0/snyk-macos"
    sha256 "8416a5440e0f7333ac35201e30e9481ee7c39f7e3c98d129a8177e29fce4959c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1119.0/snyk-linux"
    sha256 "31521b5addf3ed457d7bfc385e868374659b3875e9239db0d6cd6637237e0b18"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
