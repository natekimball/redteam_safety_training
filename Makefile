
me:
	squeue --me

out:
	tail -f *.out

err:
	tail -f *.err

clean:
	rm -f *.err *.out

sbatch:
	sbatch curiosity.slurm
